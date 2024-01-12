import 'package:flutter/material.dart';
import 'package:todo/model/model.dart';
import 'package:todo/service/service.dart';

class TodoProvider extends ChangeNotifier{
TextEditingController subjectcontroller = TextEditingController();
TextEditingController contentcontroller = TextEditingController();
TodoService todoservice = TodoService();
List <TodoModel> notelist = [];

void getTasks()async{
  try{
    notelist = await todoservice.getData();
    notifyListeners();
  }catch(e){
    throw e;
  }
  notifyListeners();
}
}