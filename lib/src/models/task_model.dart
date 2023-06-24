import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  String key;

  @HiveField(1)
  String taskTitle;

  @HiveField(2)
  String taskDescription;

  @HiveField(3)
  bool isDone;

  @HiveField(4)
  List<String> checklist;

  TaskModel(this.key, this.taskTitle, this.taskDescription, this.isDone,
      this.checklist);
}
