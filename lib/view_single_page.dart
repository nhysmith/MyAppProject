import 'package:flutter/material.dart';
import 'package:habittracker_v3/view_all_page.dart';

import 'add_page.dart';
import 'calendar_page.dart';
import 'main.dart';

List<Item> temp = List<Item>.empty(growable: true);
//taskManager.currentTask.log.forEach();
/*taskManager.currentTask.log.forEach((element) {
print(element);
temp.add(Item(
headerValue: element.toString(),
expandedValue: ' '
));
});*/
//int _counter = taskManager.currentTask.log.length;


class ViewSinglePage extends StatefulWidget {
  const ViewSinglePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ViewSinglePage> createState() => _ViewSinglePageState();
}

class _ViewSinglePageState extends State<ViewSinglePage> {

  int _counter = taskManager.currentTask.log.length;
  String _name = taskManager.currentTask.taskName;

  //String _test = "Test";

  void _incrementCounter() {
    setState(() {
      //_counter++;
      DateTime currentDate = DateTime.now();
      taskManager.currentTask.log.add(currentDate);
      //taskManager.currentTask.log.forEach((element) {print(element);});
      _counter = taskManager.currentTask.log.length;

      //taskManager.currentTask.counter++;
      print('update habit counter');
      temp.add(Item(
          headerValue: currentDate.toString(),
          expandedValue: ' ',
          current: currentDate,
      ));
      //temp = List<Item>.empty(growable: true);
      /*taskManager.currentTask.log.forEach((element) {
        print(element);
        temp.add(Item(
            headerValue: element.toString(),
            expandedValue: ' '
        ));
      });*/
    });
    /*Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => super.widget));*/
    //Navigator.push(context,
    //    MaterialPageRoute(builder: (context) => MyHomePage(title: 'Habit Tracker Home Page')));
  }

  void _delete() {
    setState(() {
      //_counter++;
      //taskManager.currentTask.counter++;
      taskManager.tasks.removeAt(taskManager.taskIndex);
      print('deleting habit ');
    });
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: 'Habit Tracker Home Page')));
  }

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

  void _setCounter(){
    setState(() {
      _counter = taskManager.currentTask.log.length;
    });
  }

  void _setName(){
    setState(() {
      //_counter = taskManager.currentTask.log.length;
      _name = taskManager.currentTask.taskName;

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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /*Text(
              'Habit: ${taskManager.tasks[index].taskName}',
              style: Theme.of(context).textTheme.headline5,
            ),*/
           Container(
             margin: const EdgeInsets.only(top: 35),
             alignment: Alignment.topCenter,
             child: Text(
             '${_name}',
             style: Theme.of(context).textTheme.headline5,
           ),
           ),
            SizedBox(width: 20,),
            //CustomPaint(),
            Container(
              height: 50,
              width: 50,
              //padding: EdgeInsets.only(left: 100, right: 100),
              decoration: BoxDecoration(
                  color: taskManager.currentTask.iconColor,
                  shape: BoxShape.circle
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                'Created: ${taskManager.currentTask.created}',
                //style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                'Number of times completed: ${_counter}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                onChanged: (name)
                {
                  //print('Habit Name: $name');
                  taskManager.currentTask.taskName = name;
                  _setName();
                },
                initialValue: taskManager.currentTask.taskName,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Task Name',
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 25),
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(left: 10, right: 10),

              child: TextFormField(
                onChanged: (description)
                {
                  //print('Habit Name: $name');
                  taskManager.currentTask.description = description;
                },
                initialValue: taskManager.currentTask.description,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
            ),

            const SizedBox(height: 25,),
            /*Text(
              'Description: ${taskManager.currentTask.description}',
              style: Theme.of(context).textTheme.headline6,
            ),*/

            //const SizedBox(height: 30,),
            //SizedBox(height: 30,),
            /*Text(
              'Number of times completed: ${_counter}',
              style: Theme.of(context).textTheme.headline6,
            ),*/
            /*Text(
              '${taskManager.currentTask.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),*/
            ElevatedButton(onPressed: _incrementCounter, child: Text('Complete Habit')),
            //ElevatedButton(onPressed: _delete, child: Text('Delete Habit'), style: ElevatedButton.styleFrom(
              //primary: Colors.redAccent)),
            //ElevatedButton(onPressed: _delete, child: Text('Delete Habit'), ),
            MyStatelessWidget(),
            /*ListView.builder(
                padding: const EdgeInsets.only(right: 20),
                shrinkWrap: true,
                itemCount: taskManager.currentTask.log.length,
                itemBuilder: (BuildContext context, int index)
                {
                  return Container(
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[

                          Text(
                            'Date: ${taskManager.currentTask.log[index]}',
                            //tyle: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      )
                  );
                }
            ),*/
            //ElevatedButton(onPressed: () => MyStatelessWidget(), child: Text('Delete Habit'), ),

            //ElevatedButton(onPressed: showDialog(context: context, builder: (_) => AlertDialog()), child: Text('Delete Habit'), ),
            //MyStatefulWidget.callback((p0) { }),
            MyStatefulWidget.callback(
                    () =>
                {
                  //print('callback: ${_count}'),
                  //iconColor.withBlue(_b),
                  //b = _b,
                  _setCounter()
                }
            ),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _home,
        tooltip: 'Home',
        child: const Icon(Icons.home),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.redAccent),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you want to delete this habit?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: (){ Navigator.pop(context, 'OK');
              taskManager.tasks.removeAt(taskManager.taskIndex);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'Habit Tracker Home Page')));
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Delete Habit'),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.current,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
  late DateTime current;
}

/*List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}*/

List<Item> generateDate() {
  print('here');
  temp = List<Item>.empty(growable: true);
  taskManager.currentTask.log.forEach((element) {
    temp.add(Item(
      headerValue: element.toString(),
      expandedValue: '',
      current: element,
    ));
    print(element);
  });
  return temp;
}
/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
   MyStatefulWidget({Key? key}) : super(key: key);

  late void Function() _callback;

  MyStatefulWidget.callback(final void Function() callback)
  {
    _callback = callback;
  }


  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<Item> _data = generateDate();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle:
              const Text('To delete this entry, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  //print(index);
                  _data.removeWhere((Item currentItem) => item == currentItem);
                  //deleteLog(item.current)
                  taskManager.currentTask.log.removeWhere((DateTime currentItem) => item.current == currentItem);
                  //_setCounter();
                  //_counter = taskManager.currentTask.log.length;
                  //print('$_counter');
                  widget._callback();

                  /*Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => super.widget));*/
                  //add code to delete datetime from log
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

