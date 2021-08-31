import 'package:app_teste/app/models/item_model.dart';
import 'package:app_teste/app/services/idun_test_interface.dart';
import 'package:dio/dio.dart';

class IdunTestServices implements IidunTest {

  @override
  Future createItem(String guid, String text) async {

    String date = DateTime.now().toIso8601String();

    Dio().post(
      "http://idun-tests.herokuapp.com/api/v1/post/create",
      data: {
        "guid": "$guid",
        "date": "$date",
        "text": "$text"
      }
    ).catchError((onError){
      print("ERRO IN: $onError");
    });
  }

  @override
  Future<List<ItemModel>> getList() async {
    var response = await Dio().get("http://idun-tests.herokuapp.com/api/v1/post/list");

    List<ItemModel> list = [];

    for (var item in response.data) {
      list.add(ItemModel.fromJson(item));
    }
    return list;
  }

}