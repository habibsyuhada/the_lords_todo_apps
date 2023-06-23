import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskView extends StatefulWidget {
  const TaskView({
    super.key,
  });

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box('tasks').listenable(),
      builder: (context, boxs, widget) {
        if (boxs.values.isEmpty)
          return Center(
            child: Text("No Taks"),
          );
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListView.builder(
            itemCount: boxs.values.length,
            itemBuilder: (context, index) {
              var box = boxs.getAt(index);
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade100,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.grey[50],
                ),
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Text(box.taskTitle),
                    Text(box.taskTitle),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
