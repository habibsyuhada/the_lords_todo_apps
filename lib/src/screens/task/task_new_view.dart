import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:the_lords_todo_apps/src/models/task_model.dart';

class TaskNewView extends StatefulWidget {
  const TaskNewView({
    super.key,
  });

  static const routeName = '/task_new_view';

  @override
  State<TaskNewView> createState() => _TaskNewViewState();
}

class _TaskNewViewState extends State<TaskNewView> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Create New Task'),
        // centerTitle: true,
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: _createNewTaskProcess,
            child: const Text('Create'),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: taskTitleController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Task Title',
              ),
            ),
            TextFormField(
              controller: taskDescriptionController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 3,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Description',
              ),
            ),
          ],
        ),
      ),
    );
  }

  _createNewTaskProcess() async {
    if (taskTitleController.text == '') {
      return null;
    }

    var tasks = Hive.box('tasks');

    var task = TaskModel(
      taskTitleController.text,
      taskDescriptionController.text,
      false,
    );

    tasks.add(task);

    Navigator.pop(context);
  }
}
