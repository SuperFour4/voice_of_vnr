import 'package:voice_of_vnr/Event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'data.dart';
class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Map<DateTime, List<Event>> selectedEvents=list;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Calendar"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            daysOfWeekStyle: DaysOfWeekStyle(weekendStyle: TextStyle(color: Colors.red)),
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              print(focusedDay);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            eventLoader: _getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ..._getEventsfromDay(selectedDay).map(
                (Event event) => ListTile(
              title: Text(
                event.title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:voice_of_vnr/event_firestore_details.dart';
// import 'package:voice_of_vnr/event_details_page.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// import 'package:voice_of_vnr/Event.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Calendar',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home:EventCalendar()
//     );
//   }
// }
//
// class EventCalendar extends StatefulWidget {
//   @override
//   _EventCalendarState createState() => _EventCalendarState();
// }
//
// class _EventCalendarState extends State<EventCalendar> {
//   Map<DateTime, List<dynamic>> _events;
//   List<dynamic> _selectedEvents;
//
//   @override
//   void initState() {
//     super.initState();
//     _events = {};
//     _selectedEvents = [];
//   }
//
//   Map<DateTime, List<dynamic>> _groupEvents(List<EventModel> allEvents) {
//     Map<DateTime, List<dynamic>> data = {};
//     allEvents.forEach((event) {
//       DateTime date = DateTime(
//           event.eventDate.year, event.eventDate.month, event.eventDate.day, 12);
//       if (data[date] == null) data[date] = [];
//       data[date].add(event);
//     });
//     return data;
//   }
//   List<EventModel> _getEventsfromDay(DateTime date) {
//     return _events[date] ?? [];
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Calendar'),
//       ),
//       body: StreamBuilder<List<EventModel>>(
//           stream: eventDBS.streamList(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               List<EventModel> allEvents = snapshot.data;
//               if (allEvents.isNotEmpty) {
//                 _events = _groupEvents(allEvents);
//               } else {
//                 _events = {};
//                 _selectedEvents = [];
//               }
//             }
//             return SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   TableCalendar(
//                     eventLoader: _getEventsfromDay,
//                     firstDay: DateTime(1990),
//                     lastDay: DateTime(2050),
//                     calendarFormat:  CalendarFormat.month,
//                     calendarStyle: CalendarStyle(
//                         canMarkersOverflow: true,
//                         todayDecoration: BoxDecoration(color: Colors.orange),
//                         selectedDecoration: BoxDecoration(color: Colors.black),
//                         todayTextStyle: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18.0,
//                             color: Colors.white)),
//                     headerStyle: HeaderStyle(
//                       titleCentered: true,
//                       formatButtonDecoration: BoxDecoration(
//                         color: Colors.orange,
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       formatButtonTextStyle: TextStyle(color: Colors.white),
//                       formatButtonShowsNext: false,
//                     ),
//                     startingDayOfWeek: StartingDayOfWeek.monday,
//                     onDaySelected: (date, events) {
//                       setState(() {
//                         _selectedEvents = events as List;
//                       });
//                     },
//                     calendarBuilders: CalendarBuilders(
//                       selectedBuilder: (context, date, events) => Container(
//                           margin: const EdgeInsets.all(4.0),
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               color: Theme.of(context).primaryColor,
//                               borderRadius: BorderRadius.circular(10.0)),
//                           child: Text(
//                             date.day.toString(),
//                             style: TextStyle(color: Colors.white),
//                           )),
//                       todayBuilder: (context, date, events) => Container(
//                           margin: const EdgeInsets.all(4.0),
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               color: Colors.orange,
//                               borderRadius: BorderRadius.circular(10.0)),
//                           child: Text(
//                             date.day.toString(),
//                             style: TextStyle(color: Colors.white),
//                           )),
//                     ),
//                   ),
//                   ..._selectedEvents.map((event) => ListTile(
//                     title: Text(event.title),
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (_) => EventDetailsPage(
//                                 event: event,
//                               )));
//                     },
//                   )),
//                 ],
//               ),
//             );
//           }),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () => Navigator.pushNamed(context, 'add_event'),
//       ),
//     );
//   }
// }