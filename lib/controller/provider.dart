import 'package:flutter/material.dart';
import 'package:todo/model/model.dart';
import 'package:todo/service/service.dart';

class TodoProvider extends ChangeNotifier {
  TextEditingController subjectcontroller = TextEditingController();
  TextEditingController contentcontroller = TextEditingController();
  TodoService todoservice = TodoService();
  List<TodoModel> notelist = [];

  void getTasks() async {
    try {
      notelist = await todoservice.getData();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  createtodo() async {
    try {
      await todoservice.createdata(TodoModel(
          subject: subjectcontroller.text,
          description: contentcontroller.text));
      getTasks();
    } catch (e) {
      return null;
    }
  }

  deletetodo(id) async {
    try {
      await todoservice.deletedata(id: id);
      getTasks();
    } catch (e) {
      return null;
    }
  }

  edittodo(subject,content, id) async {
    try {
      await todoservice.edittodo(TodoModel(
          subject: subject,
          description: content),id);
      getTasks();
    } catch (e) {
      return null;
    }
  }
}
