// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on IdunTest, Store {
  final _$listAtom = Atom(name: 'IdunTest.list');

  @override
  List<ItemModel> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<ItemModel> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$loadAtom = Atom(name: 'IdunTest.load');

  @override
  bool get load {
    _$loadAtom.reportRead();
    return super.load;
  }

  @override
  set load(bool value) {
    _$loadAtom.reportWrite(value, super.load, () {
      super.load = value;
    });
  }

  final _$IdunTestActionController = ActionController(name: 'IdunTest');

  @override
  void getList() {
    final _$actionInfo =
        _$IdunTestActionController.startAction(name: 'IdunTest.getList');
    try {
      return super.getList();
    } finally {
      _$IdunTestActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createItem(String guid, String text) {
    final _$actionInfo =
        _$IdunTestActionController.startAction(name: 'IdunTest.createItem');
    try {
      return super.createItem(guid, text);
    } finally {
      _$IdunTestActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list},
load: ${load}
    ''';
  }
}
