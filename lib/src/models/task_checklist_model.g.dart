// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_checklist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskChecklistModelAdapter extends TypeAdapter<TaskChecklistModel> {
  @override
  final int typeId = 1;

  @override
  TaskChecklistModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskChecklistModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskChecklistModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.taskTitle)
      ..writeByte(2)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskChecklistModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
