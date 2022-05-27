import 'dart:core';
import 'package:voice_of_vnr/Event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
DateTime date=DateTime.now();
Map<DateTime,List<Event>> list=
{
  DateTime.utc(2022,5,7):
  [
    Event(title:'Major Project Implementation Review phase 1'),
  ],
  DateTime.utc(2022,5,23):
  [
    Event(title:'Major Project Implementation Review phase 2'),
  ],
  DateTime.utc(2022,6,2):
  [
    Event(title:'Journal paper plagarism check and submission'),
  ],
  DateTime.utc(2022,6,5):
  [
    Event(title:'Last date of submission Hard Copy and Soft copy of major project'),
  ],
  DateTime.utc(2022,4,25):
  [
    Event(title:'IV year OPE V sem II mid I'),
  ],
  DateTime.utc(2022,4,26):
[
  Event(title:'IV year OPE VI sem II mid I'),
],
  DateTime.utc(2022,4,27):
[
  Event(title:'IV year OE IV sem II mid I'),
],
  DateTime.utc(2022,5,7):
[
  Event(title:'Major Project Implementation Review'),
]
};