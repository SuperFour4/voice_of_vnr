import 'package:flutter/material.dart';
import 'package:voice_of_vnr/Branch_pred.dart';
import 'package:voice_of_vnr/Event_calendar.dart';
import 'package:voice_of_vnr/home_page.dart';
import 'package:voice_of_vnr/text_command.dart';
import 'package:voice_of_vnr/voice_command.dart';
import 'Loading.dart';
import 'Query_page.dart';
import 'package:voice_of_vnr/voice.dart';

void main() {
  runApp(App());
}
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}


class _AppState extends State<App> {

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: 'homepage',
      routes: {
        'querypage': (context) => QueryPage(title: 'Voice Of VNR'),
        'voicepage': (context) => VoiceCommand(),
        'textpage': (context) => TextCommand(),
        'voice': (context) => Voice(),
        'load' : (context) => LoadingScreen(),
        'homepage' : (context) => UserPage(),
        'branchpred' : (context) => BranchPred(),
        'calendar' : (context) => EventCalendar()
      },
      home: UserPage(),
    );
  }
}