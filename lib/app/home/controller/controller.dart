import 'package:app_teste/app/models/item_model.dart';
import 'package:app_teste/app/services/idun_test_services.dart';
import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class Controller = IdunTest with _$Controller;

abstract class IdunTest with Store {
  @observable
  List<ItemModel> list = [];

  @observable
  bool load = false;

  @action
  void getList() {
    IdunTestServices().getList().then((value){
      list = value;
      load = true;
    });
  }

  @action
  void createItem(String guid, String text) {
    IdunTestServices().createItem(guid, text).then((value){
      load = false;
      Future.delayed(Duration(seconds: 1)).then((value){
        getList();
      });
    });
  }

}