import 'package:flutter/material.dart';
import 'package:habittracker_v3/task_manager.dart';
import 'package:habittracker_v3/view_all_page.dart';

import 'add_page.dart';
import 'calendar_page.dart';

TaskManager taskManager = TaskManager();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker Demo',
      theme: ThemeData(

        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'Habit Tracker Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });

    Navigator.push(context,
    MaterialPageRoute(builder: (context) => const AddPage(title: 'Add Habit')));
  }
  void _addHabit() {
    setState(() {
    });

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddPage(title: 'Add Habit')));
  }
  void _viewHabits() {
    setState(() {
    });

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ViewAllPage(title: 'View All Habits')));
  }

  void _calendarView() {
    setState(() {
    });

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CalendarPage(title: 'Calendar')));
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 35,),

            Container(
              alignment: Alignment.center,
              child: Text(
                'Total Habits Tracked: ${taskManager.tasks.length} ',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            SizedBox(height: 35,),
            ElevatedButton(onPressed: _addHabit, child: Text('Add New Habit')),
            ElevatedButton(onPressed: _viewHabits, child: Text('View All Habits')),
            ElevatedButton(onPressed: _calendarView, child: Text('Calendar')),


          /* Row(mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[

                   ElevatedButton(onPressed: _addHabit, child: Text('Add New Habit'))
                  ]
             ),
            SizedBox(height: 10,),

            Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  ElevatedButton(onPressed: _viewHabits, child: Text('View All Habits'))
                ]
            ),
            SizedBox(height: 10,),

            Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  ElevatedButton(onPressed: _calendarView, child: Text('Calendar'))
                ]
            ),*/
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
       // onPressed: _incrementCounter,
        //tooltip: 'Increment',
        //child: const Icon(Icons.add),
     // ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
