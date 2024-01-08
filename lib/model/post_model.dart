class Post {
  int? id;
  String? title;
  String? body;
  int? userId;

  Post({this.id, this.title, this.body, this.userId});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'userId': userId,
      };
}
