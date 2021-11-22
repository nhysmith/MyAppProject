import 'package:flutter/material.dart';
import 'package:habittracker_v3/task.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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

    //Save();
    //Load();

    /*var __test = jsonDecode(taskListString) as List;
    List<Task> _test = __test.map((obj) => Task.fromJson(obj)).toList();
    _test.forEach((element) {
      print(element.taskName);

    });*/
  }

  void Save() async
  {
    String taskListString = jsonEncode(tasks);
    print(taskListString);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Save', taskListString);
  }

  void Load() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('Save'))
      {
        String jsonString = prefs.getString('Save').toString();

        var __test = jsonDecode(jsonString) as List;
        List<Task> _test = __test.map((obj) => Task.fromJson(obj)).toList();
        print(jsonString);
        tasks = _test;
        if(tasks.isNotEmpty)
          {
            setCurrentTask(0);
          }
        _test.forEach((element) {
          print(element.taskName);

        });
      }

  }
}