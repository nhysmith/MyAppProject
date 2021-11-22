
import 'package:flutter/material.dart';
import 'package:habittracker_v3/task.dart';
import 'package:habittracker_v3/view_all_page.dart';
import 'package:habittracker_v3/view_single_page.dart';

import 'calendar_page.dart';
import 'main.dart';
import 'my_home_page.dart';

int r = 0;
int g = 0;
int b = 0;
Color iconColor = Color.fromARGB(255, r, g, b);

class AddPage extends StatefulWidget {
  const AddPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  //int _counter = 0;
  String taskName = " ";
  String description = " ";

  void _home() {
    setState(() {
    });

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Habit Tracker Home Page')));
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

  void _add() {
    setState(() {
    });
    Task task = Task(taskName, description, iconColor);
    task.setIconColor(r, g, b);
    taskManager.tasks.add(task);
    taskManager.Save();
    print('Habit Name: ' + task.taskName);
    print('Habit Description: ' + task.description);


    print('r: ${r}');
    print('g: ${g}');
    print('b: ${b}');

    //taskManager.tasks.forEach((element) {print(element.taskName);});
    r = 0;
    g = 0;
    b = 0;
    _setColor();
    //print(task.taskName);
    //TaskManager.add(task);
    taskManager.currentTask = task;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ViewSinglePage(title: 'View Habit')));
    /*Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ViewAllPage(title: 'View All Habits')));*/
  }

  Color _getColor()
  {
   return Color.fromARGB(255, r, g, b);
  }

  void _setColor()
  {
    //Color color;
      setState(() {
      iconColor = Color.fromARGB(255, r, g, b);
    });
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
                leading: Icon(Icons.home),
                title: Text("Home"),
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 35,),
            /*Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Habit Name:',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  //SizedBox(width: 4,),
                ]
            ),*/
            Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                onChanged: (name)
                {
                  //print('Habit Name: $name');
                  taskName = name;
                },
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Task Name'
                ),
              ),
            ),

            const SizedBox(height: 40,),
            /*Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Habit Description:  ',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  //TextField()
                ]
            ),*/
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child:  TextField(
                onChanged: (descript)
                {
                  //print('Habit Name: $name');
                  description = descript;
                },
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Description'
                ),
              ),
            ),

            SizedBox(height: 40,),
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text('Icon Color:',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(width: 20,),
              //CustomPaint(),
                Container(
                  height: 50,
                  width: 50,
                  //padding: EdgeInsets.only(left: 100, right: 100),
                  decoration: BoxDecoration(
                    color: iconColor,
                    shape: BoxShape.circle
                  ),
                ),
              /*Icon(
              Icons.stop_rounded,
              color: iconColor,
            ),*/
            ],
            ),
            /*Icon(
              Icons.stop_rounded,
              color: Colors.blue.shade400,
            ),
            Row(
              children: <Widget>[
                Text('r',
                  style: Theme.of(context).textTheme.headline5,
                ),
                MyStatefulWidget.callback(
                        (_r) =>
                    {
                      print('callback: ${_r}'),
                      //iconColor.withRed(_r),
                      r = _r,
                      _setColor()
                    }
                ),
              ],
            ),*/

            //MyStatefulWidget.callback(() { }),
            /*Text('r',
              style: Theme.of(context).textTheme.headline5,
            ),*/
            SliderTheme(data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red,
              inactiveTrackColor: Colors.red[100],
              thumbColor: Colors.red,
              //overlayColor: Colors.red[50]
              overlayColor: Color.fromARGB(100, 255, 205, 210)

            ),
                child:  SliderWidget.callback(
                        (_r) =>
                    {
                      //print('callback: ${_r}'),
                      //iconColor.withRed(_r),
                      r = _r,
                      _setColor()
                    }
                ),
            ),
            SliderTheme(data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.green,
                inactiveTrackColor: Colors.green[100],
                thumbColor: Colors.green,
                overlayColor: Color.fromARGB(100, 200, 230, 201)
            ),
              child:  SliderWidget.callback(
                      (_g) =>
                  {
                    //print('callback: ${_g}'),
                    //iconColor.withRed(_r),
                    g = _g,
                    _setColor()
                  }
              ),
            ),
            SliderTheme(data: SliderTheme.of(context).copyWith(
                //activeTrackColor: Colors.red,
                //inactiveTrackColor: Colors.red[100],
                //thumbColor: Colors.red
            ),
              child:  SliderWidget.callback(
                      (_b) =>
                  {
                    //print('callback: ${_b}'),
                    //iconColor.withRed(_),
                    b = _b,
                    _setColor()
                  }
              ),
            ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: ElevatedButton(onPressed: _add, child: const Text('Add'))
            ,
          )
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _home,
        tooltip: 'Home',
        child: const Icon(Icons.home),
      ),*/  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class SliderWidget extends StatefulWidget {
   SliderWidget({Key? key}) : super(key: key);

  late void Function(int) _callback;

  SliderWidget.callback(final void Function(int) callback)
  {
    _callback = callback;
  }

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _SliderWidgetState extends State<SliderWidget> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 255,
      //divisions: 5,
      //label: _currentSliderValue.round().toString(),
      //activeColor: LinearGradient(colors: <Color>[Color(0xffee0000)],
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
          widget._callback(_currentSliderValue.round());
        });
      },
    );

  }

}

