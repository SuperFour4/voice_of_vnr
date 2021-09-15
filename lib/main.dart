import 'package:flutter/material.dart';
import 'package:voice_of_vnr/text_command.dart';
import 'package:voice_of_vnr/voice_command.dart';
import 'home_page.dart';

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
        'homepage': (context) => MyHomePage(title: 'Voice Of VNR'),
        'voicepage': (context) => VoiceCommand(),
        'textpage': (context) => TextCommand()
      },
      home: MyHomePage(title: 'Voice Of VNR'),
    );
  }
}