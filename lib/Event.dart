import 'package:flutter/foundation.dart';

class Event {
  final String title;
  Event({@required this.title});

  String toString() => this.title;
}
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_helpers/firebase_helpers.dart';
//
// class EventModel{
//   final String id;
//   final String title;
//   final String description;
//   final DateTime eventDate;
//
//   EventModel({this.id,this.title, this.description, this.eventDate});
//
//   factory EventModel.fromMap(Map data) {
//     return EventModel(
//       title: data['title'],
//       description: data['description'],
//       eventDate: data['event_date'],
//     );
//   }
//
//   factory EventModel.fromDS(String id, Map<String,dynamic> data) {
//     return EventModel(
//       id: id,
//       title: data['title'],
//       description: data['description'],
//       eventDate: data['event_date'].toDate(),
//     );
//   }
//
//   Map<String,dynamic> toMap() {
//     return {
//       "title":title,
//       "description": description,
//       "event_date":eventDate,
//       "id":id,
//     };
//   }
// }