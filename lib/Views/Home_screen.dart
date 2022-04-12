import 'package:app2/UI/Add_UI.dart';
import 'package:app2/helper/Post_helper.dart';
import 'package:app2/model/Post.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // create a boolean for Loading data
  bool isLoading = false;

  // make a list and inside pass your model class name
  List<Post>? posts;

  // create a function and store data in posts variable from  PostHelper class
  getData() async {
    posts = await PostHelper().getPost();
    setState(() {
      isLoading = true;
    });
  }

  // Controller

  TextEditingController _controllerID = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerGender = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_sharp),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          //  Open User data add Option
          // AddUI(context, _controllerID, _controllerName, _controllerGender);
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add User"),
                  content: Container(
                    height: 270,
                    child: Column(
                      children: [
                        AddUI(
                            _controllerID, _controllerName, _controllerGender),
                        SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () async {
                              var userId = _controllerID.text;
                              var userName = _controllerName.text;
                              var userGender = _controllerGender.text;

                              await PostHelper().addPost(int.parse(userId), userName, userGender);
                              userId = "";
                              userName = "";
                              userGender = "";
                              Navigator.pop(context);
                              setState(() {

                              });
                            },
                            child: Text("Submit"),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: Visibility(
        visible: isLoading,
        child: ListView.builder(
            itemCount: posts != null ? posts!.length : 0,
            itemBuilder: (_, index) {
              return Card(
                child: ListTile(
                  leading: Text(posts![index].id.toString()),
                  title: Text(posts![index].name.toString()),
                  subtitle: Text(posts![index].gender.toString()),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                        IconButton(onPressed: ()  {

                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text("Are you sure ?"),
                              content: Text("Do you want to delete ${posts![index].id} ?"),
                              actions: [
                                TextButton(onPressed: ()async{
                                  await PostHelper().deletePost(posts![index].id);
                                }, child: Text("Ok")),
                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text("Cancel"))
                              ],
                            );
                          });

                        }, icon: Icon(Icons.delete))
                      ],
                    ),
                  ),
                ),
              );
            }),
        replacement: Align(
            alignment: Alignment.center, child: CircularProgressIndicator()),
      ),
    );
  }
}
