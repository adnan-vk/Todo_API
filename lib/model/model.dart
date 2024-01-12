// ignore_for_file: prefer_collection_literals

class TodoModel {
  String? id;
  String? subject;
  String? description;
  TodoModel({this.id, required this.subject, required this.description});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json['id'], subject: json['name'], description: json['description']);
  }

  Map<String, dynamic>toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.subject;
    data['description'] = this.description;
    data['id'] = this.id;
    return data;
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data =  Map<String, dynamic>();
  //   data["title"] = this.subject;
  //   data["description"] = this.description;
  //   data["id"] = this.id;
  //   return data;
  // }
}
