import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app/app_widget.dart';
import 'app/home/controller/controller.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<Controller>(Controller());
  runApp(MyApp());
}




