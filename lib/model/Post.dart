import 'dart:convert';



List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
   required this.id,
    required this.name,
    required this.gender,
  });

  int id;
  String name;
  String gender;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    name: json["name"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gender": gender,
  };
}








// List<Post> postFromJson(String str) =>
//     List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
//
// String postToJson(List<Post> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Post {
//   Post({
//     this.userId,
//     required this.id,
//     required this.title,
//     required this.body,
//   });
//
//   int? userId;
//   int id;
//   String title;
//   String body;
//
//   factory Post.fromJson(Map<String, dynamic> json) => Post(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         body: json["body"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "id": id,
//         "title": title,
//         "body": body,
//       };
// }
