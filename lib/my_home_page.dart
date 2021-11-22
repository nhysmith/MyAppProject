import 'package:flutter/material.dart';
import 'package:habittracker_v3/view_all_page.dart';
import 'package:habittracker_v3/view_single_page.dart';

import 'add_page.dart';
import 'calendar_page.dart';
import 'main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color color = Colors.white;
  String name = '';


  void _incrementCounter() {
    setState(() {

    });

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddPage(title: 'Add Habit')));
  }

  void _home() {
    setState(() {
    });

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home')));
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
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              Container(
                height: 65,
                child: const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                    ),
                    child: Text("Menu")),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: _home,
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text("Add"),
                onTap: _addHabit,
              ),
              ListTile(
                leading: Icon(Icons.checklist),
                title: Text("View All: List View"),
                onTap: _viewHabits,
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text("View All: Calendar View"),
                onTap: _calendarView,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //SizedBox(height: 35,),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(35),
              child: Text(
                'Habit Keeper',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),

            Container(
              alignment: Alignment.center,
              child: Text(
                'Total Habits Tracked: ${taskManager.tasks.length} ',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            SizedBox(height: 35,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //RotatedBox(quarterTurns: 1, child: Icon(Icons.compare_arrows)
                  FloatingActionButton(
                      onPressed: _viewHabits,
                      child: Icon(Icons.checklist),
                      //RotatedBox(quarterTurns: 1, child: Icon(Icons.view_column)),
                      tooltip: 'View All Habits',
                      heroTag: 'btn1',
                  ),
                  /*IconButton(
                      onPressed: _viewHabits,
                      icon: Icon(Icons.view_column),
                      tooltip: 'View All Habits'),*/
                  FloatingActionButton(onPressed: _addHabit, tooltip: 'Add New Habit', child: Icon(Icons.add),
                    heroTag: 'btn2',
                  ),
                  FloatingActionButton(onPressed: _calendarView, tooltip: 'Calendar', child: Icon(Icons.calendar_today),
                    heroTag: 'btn3',
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 25, top: 50),
              child: Text(
                'Most Recently Viewed:',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            ListTile(
              onTap: () => {
                if(taskManager.tasks.length > 0)
                  {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewSinglePage(title: 'View Habit')))
                  }
                else
                {

                }
              },
              title: Container(
                height: 50,
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: taskManager.tasks.length > 0 ? taskManager.currentTask.iconColor : color,
                          shape: BoxShape.circle
                        ),
                      ),
                      Text(taskManager.tasks.length > 0 ? taskManager.currentTask.taskName : name),
                    ],
                  ),
                ),
              ),
            ),
            /*SizedBox(height: 35,),
            Container(
              //height: 50,
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: ElevatedButton(onPressed: _addHabit, child: Text('Add New Habit')),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: ElevatedButton(onPressed: _viewHabits, child: Text('View All Habits')),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: ElevatedButton(onPressed: _calendarView, child: Text('Calendar')),
            ),*/


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
    );
  }
}
