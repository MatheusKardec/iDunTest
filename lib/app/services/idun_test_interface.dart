import 'package:app_teste/app/models/item_model.dart';

abstract class IidunTest{

  Future<List<ItemModel>> getList();
  Future createItem(String guid, String text);

}