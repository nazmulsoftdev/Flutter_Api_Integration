import 'dart:convert';

import 'package:app2/model/Post.dart';
import 'package:http/http.dart' as http;

class PostHelper {
  // get api data by this request

  Future<List<Post>?> getPost() async {
    var response = await http.get(Uri.parse("http://192.168.0.103:3000/api"));

    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }

//  add new data and hit in api

  Future addPost(int id, String name, String gender) async {
    var response = await http.post(Uri.parse("http://192.168.0.103:3000/api"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"id": id, "name": name, "gender": gender}));
    return response;
  }

//  Delete user from api

  Future deletePost(int id) async {
    var response = await http.delete(
        Uri.parse("http://192.168.0.103:3000/api/$id"),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
       );
      return response;

  }


}
