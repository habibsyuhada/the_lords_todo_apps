import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_lords_todo_apps/src/screens/task/task_new_view.dart';

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
        if (boxs.values.isEmpty) {
          return Center(
            child: Text("No Taks"),
          );
        }
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListView.builder(
            itemCount: boxs.values.length,
            itemBuilder: (context, index) {
              var box = boxs.getAt(index);
              return Card(
                color: Colors.blue.shade100,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      InkWell(
                        // splashColor: ,
                        onTap: () {
                          box.isDone = !box.isDone;
                          boxs.put(box.key, box);
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade200,
                              shape: BoxShape.rectangle,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                bottomLeft: Radius.circular(4.0),
                              ),
                            ),
                            child: Icon(box.isDone
                                ? Icons.check_box
                                : Icons.check_box_outline_blank)),
                      ),
                      // const SizedBox(width: 10),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(5),
                          title: Text(box.taskTitle),
                          subtitle: Text(box.taskDescription),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TaskNewView(key_box: box.key),
                              ),
                            );
                          },
                        ),
                      ),
                      //const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
