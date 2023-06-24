import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_lords_todo_apps/src/models/task_checklist_model.dart';
import 'package:the_lords_todo_apps/src/models/task_model.dart';

class TaskNewView extends StatefulWidget {
  const TaskNewView({super.key, this.key_box = ''});
  final String key_box;

  static const routeName = '/task_new_view';

  @override
  State<TaskNewView> createState() => _TaskNewViewState();
}

class _TaskNewViewState extends State<TaskNewView> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();

  var isUpdate = false;

  var tasks = null;
  var task = null;

  List<TaskChecklistModel> _values = [];

  @override
  void initState() {
    super.initState();
    if (widget.key_box != '') {
      isUpdate = true;
      tasks = Hive.box('tasks');
      task = tasks.get(widget.key_box);
      taskTitleController.text = task.taskTitle;
      taskDescriptionController.text = task.taskDescription;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: isUpdate ? null : Text('Create New Task'),
        // centerTitle: true,
        actions: <Widget>[
          if (!isUpdate) ...[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: _createNewTaskProcess,
              child: const Text('Create'),
            ),
          ],
          if (isUpdate) ...[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: _deleteTaskProcess,
              child: const Text('Delete'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: _updateTaskProcess,
              child: const Text('Save'),
            ),
          ],
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
                labelText: 'Notes',
              ),
            ),
            Text('Checklist'),
            TextFormField(
              onChanged: _onChangeChecklist(),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'New checklist entry',
                prefixIcon: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _createNewTaskProcess() {
    if (taskTitleController.text == '') {
      return null;
    }

    var tasks = Hive.box('tasks');

    var key = DateTime.now().microsecondsSinceEpoch.toString();
    var task = TaskModel(key, taskTitleController.text,
        taskDescriptionController.text, false, []);

    tasks.put(key, task);

    inspect(task);

    Navigator.pop(context);
  }

  _updateTaskProcess() {
    task.taskTitle = taskTitleController.text;
    task.taskDescription = taskDescriptionController.text;

    tasks.put(widget.key_box, task);
    Navigator.pop(context);
  }

  _deleteTaskProcess() {
    tasks.delete(widget.key_box);
    Navigator.pop(context);
  }

  _onChangeChecklist() {}
}
