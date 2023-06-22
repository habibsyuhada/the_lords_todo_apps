import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_1/src/models/task_model.dart';
import 'package:test_1/src/screens/home_view.dart';
import 'package:test_1/src/screens/task/task_new_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox('tasks');

  runApp(MaterialApp(
    home: const HomeView(), // becomes the route named '/'
    routes: <String, WidgetBuilder>{
      TaskNewView.routeName: (BuildContext context) => const TaskNewView(),
    },
  ));
}
