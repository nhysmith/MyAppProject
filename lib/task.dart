import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';

class Task
{
  String taskName;
  String description;
  DateTime created = DateTime.now();
  int counter = 0;
  //int r = 0;
  //int g = 0;
  //int b = 0;
  Color iconColor = const Color.fromARGB(255,0,0,0);
  Task(this.taskName, this.description, this.iconColor);
  List<DateTime> log = List<DateTime>.empty(growable: true);
  //List<Task> tasks = List<Task>.empty(growable: true);

  void SetData(String _name, String _desc, Color _color, DateTime _created, int _counter, List<DateTime> _log)
  {
    taskName = _name;
    description = _name;
    iconColor = _color;
    created = _created;
    counter = _counter;
    log = _log;
  }

  //Update counter()
  //getters and setters
  String getName()
  {
    return taskName;
  }
  void setIconColor(int r,int g,int b)
  {
    iconColor = Color.fromARGB(255,r,g,b);
    //iconColor.withRed(r);
    //iconColor.withGreen(g);
    //iconColor.withBlue(b);
  }

//packages needed

  Map toJson()
  {
    List<String> dates =  List<String>.empty(growable: true);

    log.forEach((element) =>
    {
    dates.add(element.toIso8601String())
    });

    return
    {
    'taskName': taskName,
    'description': description,
    'iconColor': iconColor.toString(),
    'created': created.toIso8601String(),
    'counter': counter.toString(),
    'log': jsonEncode(dates),
    };
  }

  factory Task.fromJson(dynamic json)
  {
    String _name = json['taskName'] as String;
    String _description = json['description'] as String;

    String _iconColorString = json['iconColor'] as String;
    Color _iconColor = Color(int.parse(_iconColorString.split('(0x')[1].split(')')[0], radix: 16));

    DateTime _created = DateTime.parse(json['created'] as String);
    int _counter = int.parse(json['counter'] as String);

    var _logList = jsonDecode(json['log']);
    List<String> _logString = List.from(_logList);
    List<DateTime> _log = List<DateTime>.empty(growable: true);

    _logString.forEach((element) =>
    {
    _log.add(DateTime.parse(element))
    });

    Task _task = Task('','', const Color.fromARGB(255,0,0,0));
    _task.SetData(_name, _description, _iconColor, _created, _counter, _log);
    return _task;
  }
}