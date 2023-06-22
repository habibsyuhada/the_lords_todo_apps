import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  String taskTitle;

  @HiveField(1)
  String taskDescrption;

  @HiveField(2, defaultValue: false)
  bool isDone;

  TaskModel(this.taskTitle, this.taskDescrption, this.isDone);
}
