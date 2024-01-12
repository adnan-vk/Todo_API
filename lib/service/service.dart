import 'package:dio/dio.dart';
import 'package:todo/model/model.dart';


class TodoService {
  Dio dio = Dio();
  var endpointUrl = 'https://659fbae85023b02bfe8a5161.mockapi.io/todo';

  Future<List<TodoModel>> getData() async {
    try {
      Response response = await dio.get(endpointUrl);
      if (response.statusCode == 200) {
        var jsonList = response.data as List;
        List<TodoModel> data = jsonList.map((json) {
          return TodoModel.fromJson(json);
        }).toList();
        return data;
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }

  createdata(TodoModel value)async{
    try{
      await dio.post(endpointUrl , data: value.toJson);
    }catch(e){
      throw Exception(e);
    }
  }

  // createNotes(TodoModel value) async {
  //   try {
  //     await dio.post(endpointUrl, data: value.toJson());
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // deleteNotes({required id}) async {
  //   var deleteUrl = 'https://659fbae85023b02bfe8a5161.mockapi.io/todo/$id';
  //   try {
  //     await dio.delete(deleteUrl);
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // editNotes({
  //   required dataModel value,
  //   required id,
  // }) async {
  //   try {
  //     await dio.put('https://659fbae85023b02bfe8a5161.mockapi.io/todo/$id',
  //         data: value.toJson());
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
}
