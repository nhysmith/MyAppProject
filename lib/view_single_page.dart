import 'package:flutter/material.dart';
import 'package:habittracker_v3/task.dart';
import 'package:habittracker_v3/view_all_page.dart';

import 'add_page.dart';
import 'calendar_page.dart';
import 'main.dart';
import 'my_home_page.dart';

List<Item> temp = List<Item>.empty(growable: true);
Color iconColor = taskManager.currentTask.iconColor;

String format(DateTime date)
{
  String s = '';
  return s;
}
class ViewSinglePage extends StatefulWidget {
  const ViewSinglePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ViewSinglePage> createState() => _ViewSinglePageState();
}

class _ViewSinglePageState extends State<ViewSinglePage> {

  int _counter = taskManager.currentTask.record.length;
  String _name = taskManager.currentTask.taskName;
  String note = '';
  String buttonText = 'Ascending';
  bool isAscending = true;

  void _incrementCounter() {
    setState(() {
      DateTime currentDate = DateTime.now();
      taskManager.currentTask.record.add(Record(currentDate, note));
      _counter = taskManager.currentTask.record.length;
      String formattedDate = format(currentDate);

      //taskManager.currentTask.counter++;
      print('update habit counter');
      //print(taskManager.currentTask.iconColor);
      temp.add(Item(
          headerValue: '${currentDate.month.toString()}-${currentDate.day}-${currentDate.year.toString()} ${currentDate.hour}:${currentDate.minute}:${currentDate.second.toString()}',
          expandedValue: note,
          current: currentDate,
      ));
      if(isAscending)
      {
        temp.sort((b,a) => a.compareTo(b));
      }
      else
      {
        temp.sort((b,a) => b.compareTo(a));
      }
    });
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
      _counter = taskManager.currentTask.record.length;
    });
  }

  void _setButtonText(){
    setState(() {
      isAscending = !isAscending;

      if(!isAscending)
        {
          buttonText = 'Descending';
        }
      else
        {
          buttonText = 'Ascending';
        }

      //temp = isAscending ? temp : (temp..sort()).reversed.toList();
      if(isAscending)
        {
          temp.sort((b,a) => a.compareTo(b));
        }
      else
        {
          temp.sort((b,a) => b.compareTo(a));
        }
    });
  }
  void _setName(){
    setState(() {
      _name = taskManager.currentTask.taskName;
    });
  }

  Color setTextColor()
  {
    if(taskManager.currentTask.iconColor.value < Color(0xff6c6866).value)
      {
        return Colors.white;
      }

    return Colors.black;
  }

  Color setIconColor(Color color)
  {
    return color;
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
                child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: iconColor,
                    ),
                    child: Text("Menu", style: TextStyle(color: setTextColor()))),

              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: _home,
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text("Add"),
                onTap: _addHabit,
              ),
              ListTile(
                leading: Icon(Icons.view_column),
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
        title: Text(widget.title, style: TextStyle(color: setTextColor()),),
        iconTheme: IconThemeData(color: setTextColor()),

        //leading: Ico,
        backgroundColor: iconColor,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
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
            /*Container(
              height: 50,
              width: 50,
              //padding: EdgeInsets.only(left: 100, right: 100),
              decoration: BoxDecoration(
                  color: taskManager.currentTask.iconColor,
                  shape: BoxShape.circle
              ),
            ),*/
            //MyStatelessWidget(),
            RawMaterialButton(
                //onPressed: _home,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return MyDialog();
                    });
              },
              //fillColor: taskManager.currentTask.iconColor,
              child:  Container(
                height: 50,
                width: 50,
                //padding: EdgeInsets.only(left: 100, right: 100),
                decoration: BoxDecoration(
                    color: iconColor,
                    shape: BoxShape.circle
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                'Created: ${taskManager.currentTask.created.month}-${taskManager.currentTask.created.day}-${taskManager.currentTask.created.year}',
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
                  note = description;
                },
                initialValue: taskManager.currentTask.description,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
            ),

            const SizedBox(height: 25,),
            //Slider(onChanged: (double value) { print(value); }, value: 5, min: 0, max: 100,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Container(
                //width: 50,
                //padding: EdgeInsets.only(left: 50, right: 10),
                child: ElevatedButton(onPressed: _incrementCounter, child: Text('Complete Habit'),
                  style: ElevatedButton.styleFrom(maximumSize: Size(500,100),),
                ),
              ),
              Container(
                //padding: EdgeInsets.only(right: 0,left: 0),
                child: AlertDialogWidget(),
              ),
            ],),
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

            TextButton.icon(onPressed: _setButtonText,
                icon: RotatedBox(quarterTurns: 1, child: Icon(Icons.compare_arrows),),
            label: Text(buttonText)),
            //child: Text()),

            ExpansionPanelWidget.callback( () =>
                {
                  _setCounter(),
                  print(_counter)
                }
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _home,
        tooltip: 'Home',
        child: const Icon(Icons.home),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red),
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

  int compareTo(Item _com)
  {
    return this.current.compareTo(_com.current);
  }

  String expandedValue;
  String headerValue;
  bool isExpanded;
  late DateTime current;
  late String note;
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
  temp = List<Item>.empty(growable: true);
  taskManager.currentTask.record.forEach((element) {
    temp.add(Item(
      //headerValue: element.time.toString(),
      headerValue: '${element.time.month.toString()}-${element.time.day}-${element.time.year.toString()} ${element.time.hour}:${element.time.minute}:${element.time.second.toString()}',

      expandedValue: element.note,
      current: element.time,
      //note: element.note
    ));
    print(element);
  });
  return temp;
}
/// This is the stateful widget that the main application instantiates.
class ExpansionPanelWidget extends StatefulWidget {
   ExpansionPanelWidget({Key? key}) : super(key: key);

  late void Function() _callback;

  ExpansionPanelWidget.callback(final void Function() callback)
  {
    _callback = callback;
  }


  @override
  State<ExpansionPanelWidget> createState() => _ExpansionPanelWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ExpansionPanelWidgetState extends State<ExpansionPanelWidget> {
  final List<Item> _data = generateDate();
  //_data.

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
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Dismissible(key: ValueKey(item),
              child: ListTile(
              title: Text(item.headerValue),
            ),
            background: Container(
                color: Colors.red,
            ),
              onDismissed: (DismissDirection direction) {
              setState(() {
                _data.removeWhere((Item currentItem) => item == currentItem);
                taskManager.currentTask.record.removeWhere((Record currentRecord) => item.current == currentRecord.time);
                //print('record length'+taskManager.currentTask.record.length.toString());
                widget._callback();
              });
              },
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),),
          isExpanded: item.isExpanded,);
      }).toList(),);
  }
}



/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SliderWidget(),
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
      //child: const Text('Show Dialog'),
      child:  Container(
        height: 50,
        width: 50,
        //padding: EdgeInsets.only(left: 100, right: 100),
        decoration: BoxDecoration(
            color: iconColor,
            shape: BoxShape.circle
        ),
      ),
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
          print(value.round());
        });
      },
    );

  }

}

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  Color _c = Colors.redAccent;
  double sliderValueR = 0;
  double sliderValueG = 0;
  double sliderValueB = 0;

  Color color = iconColor;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content:  Container(
        height: 50,
        width: 50,
        //padding: EdgeInsets.only(left: 100, right: 100),
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
        ),
      ),
      /*Container(
        color: _c,
        height: 20.0,
        width: 20.0,
      ),*/
      actions: <Widget>[
        /*FlatButton(
            child: Text('Switch'),
            onPressed: () => setState(() {
              _c == Colors.redAccent
                  ? _c = Colors.blueAccent
                  : _c = Colors.redAccent;
            })),*/
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red,
              inactiveTrackColor: Colors.red[100],
              thumbColor: Colors.red,
              overlayColor: Color.fromARGB(100, 255, 205, 210)
          ),
          child: Slider(
            onChanged: (double value) {
              print(value);
              setState(() {
                sliderValueR = value;
                color = Color.fromARGB(255, sliderValueR.round(), sliderValueG.round(), sliderValueB.round());
              });
            },
            value: sliderValueR, min: 0, max: 255,
          ),
        ),
        SliderTheme(
            data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.green,
            inactiveTrackColor: Colors.green[100],
            thumbColor: Colors.green,
            overlayColor: Color.fromARGB(100, 200, 230, 201)
              ),
          child: Slider(
              onChanged: (double value) {
                print(value);
                setState(() {
                  sliderValueG = value;
                  color = Color.fromARGB(255, sliderValueR.round(), sliderValueG.round(), sliderValueB.round());
                });
              },
              value: sliderValueG, min: 0, max: 255,
            ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              //activeTrackColor: Colors.green,
              //inactiveTrackColor: Colors.green[100],
              //thumbColor: Colors.green,
              //overlayColor: Color.fromARGB(100, 200, 230, 201)
          ),
          child: Slider(
            onChanged: (double value) {
              print(value);
              setState(() {
                sliderValueB = value;
                color = Color.fromARGB(255, sliderValueR.round(), sliderValueG.round(), sliderValueB.round());
              });
            },
            value: sliderValueB, min: 0, max: 255,
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: (){ //
              setState(() {
                taskManager.currentTask.iconColor = color;
                iconColor = color;
              });
              //Navigator.pop(context, 'OK');

                //Navigator.push(context, route);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ViewSinglePage(title: 'View Habit')));
              },
              child: const Text('OK'),
            ),
          ],
        )
      ],
    );
  }
}