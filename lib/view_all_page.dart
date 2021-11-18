import 'package:flutter/material.dart';
import 'package:habittracker_v3/view_single_page.dart';

import 'add_page.dart';
import 'calendar_page.dart';
import 'main.dart';


class ViewAllPage extends StatefulWidget {
  const ViewAllPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ViewAllPage> createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  int _counter = taskManager.tasks.length;

  void _home() {
    setState(() {
    });

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: 'Habit Tracker Home Page')));
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

  void _viewHabit(int index) {
    setState(() {
    });
    taskManager.setCurrentTask(index);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ViewSinglePage(title: 'View Habit')));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                ),
                child: Text("Menu")),
            ListTile(
              title: Text("Add"),
              onTap: _addHabit,
            ),
            ListTile(
              title: Text("View All: List View"),
              onTap: _viewHabits,
            ),
            ListTile(
              title: Text("View All: Calendar View"),
              onTap: _calendarView,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(right: 20),
        shrinkWrap: true,
        itemCount: taskManager.tasks.length,
      itemBuilder: (BuildContext context, int index)
      {
        return ListTile(
          onTap:  () => {_viewHabit(index)},
          title: Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      //padding: EdgeInsets.only(left: 100, right: 100),
                      decoration: BoxDecoration(
                          color: taskManager.tasks[index].iconColor,
                          shape: BoxShape.circle
                      ),
                    ),
                    //Spacer(),
                    Text(
                      '${taskManager.tasks[index].taskName}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    //Spacer()
                    //SizedBox(width: 20,),
                    //ElevatedButton(onPressed: () => {_viewHabit(index)}, child: const Text('View Habit')),
                  ],
                ),
              )
          ),
        );
      }
    ),
      /*Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 35,),
            Container(//margin: const EdgeInsets.only(top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //SizedBox(height: 35,),
                    Container(
                      child: Text(
                        'Number of Tracked Habits: ',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                )),

          ],
        )),
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: _home,
        tooltip: 'Home',
        child: const Icon(Icons.home),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
