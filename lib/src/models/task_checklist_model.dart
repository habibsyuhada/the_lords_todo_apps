import 'package:hive/hive.dart';

part 'task_checklist_model.g.dart';

@HiveType(typeId: 1)
class TaskChecklistModel {
  @HiveField(0)
  String key;

  @HiveField(1)
  String taskTitle;

  @HiveField(2)
  bool isDone;

  TaskChecklistModel(this.key, this.taskTitle, this.isDone);
}
