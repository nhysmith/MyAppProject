import 'package:habittracker_v3/task.dart';
import 'dart:convert';

class TaskManager
{
  List<Task> tasks = List<Task>.empty(growable: true);
  late Task currentTask;
  late int taskIndex;
  TaskManager();
  void setCurrentTask(int index)
  {
    currentTask = tasks[index];
    taskIndex = index;

    String taskListString = jsonEncode(tasks);
    print(taskListString);
    var __test = jsonDecode(taskListString) as List;
    List<Task> _test = __test.map((obj) => Task.fromJson(obj)).toList();
    _test.forEach((element) {
      print(element.taskName);

    });
  }
}