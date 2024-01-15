// ignore_for_file: prefer_collection_literals

class TodoModel {
  String? id;
  String? subject;
  String? description;
  TodoModel({this.id, required this.subject, required this.description});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json['id'],
        subject: json['name'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = subject;
    data['description'] = description;
    data['id'] = id;
    return data;
  }
}
