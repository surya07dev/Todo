// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo/app/data/models/task.dart';
import 'package:todo/app/data/providers/task/provider.dart';

class TaskRepository {
  TaskProvider taskProvider;
  TaskRepository({required this.taskProvider});

  List<Task> readtasks() => taskProvider.readTasks();
  void writeTasks(List<Task> tasks) => taskProvider.writeTasks(tasks);
}