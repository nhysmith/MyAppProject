import 'package:flutter/material.dart';
import 'package:habittracker_v3/view_all_page.dart';
import 'package:habittracker_v3/view_single_page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'add_page.dart';
import 'main.dart';
import 'my_home_page.dart';


class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  void _home() {
    setState(() {
    });

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: 'Habit Tracker Home Page')));
  }

  void _viewHabit(int index) {
    setState(() {
    });
    taskManager.setCurrentTask(index);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ViewSinglePage(title: 'View Habit')));
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
                      color: Colors.lightBlue,
                    ),
                    child: Text("Menu")),
              ),
              ListTile(
                title: Text("Home"),
                onTap: _home,
              ),
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
      ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        child: SfCalendar(
          view: CalendarView.month,
          showDatePickerButton: true,
          showNavigationArrow: true,
          //allowViewNavigation: false,
          /*allowedViews: <CalendarView>[
            //CalendarView.day,
            CalendarView.week,
            CalendarView.month,
            CalendarView.schedule
          ],*/
          /*onViewChanged: (ViewChangedDetails details){
            List<DateTime> dates = details.visibleDates;
            //String calendarTimeZone = '';
            //List<Object> appointment = LogDataSource(_getLogDataSource()).getVisibleAppointments(dates[0], calendarTimeZone, dates[details.visibleDates.length - 1]);
          },*/
          dataSource: LogDataSource(_getLogDataSource()),
          monthViewSettings: const MonthViewSettings(
            navigationDirection: MonthNavigationDirection.horizontal,
            appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
            showAgenda: true,
          ),
          //specialRegions: _getTimeRegions(),
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



List<Log> _getLogDataSource() {
  //final List<Log> meetings = <Log>[];
  List<Log> log = List<Log>.empty(growable: true);
  String name;
  Color color;
  taskManager.tasks.forEach((element)
  {
    name = element.taskName;
    print(name);
    color = element.iconColor;
    element.record.forEach((element) {
      log.add(Log(name, element.time,element.time,color));
    });
  });
  log.forEach((element) {
    print(element.eventName);
  });
  //print('here');
  return log;
}

class LogDataSource extends CalendarDataSource {
  LogDataSource(List<Log> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Log {
  Log(this.eventName, this.from, this.to, this.background);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay= false;
}