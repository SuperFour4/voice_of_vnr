//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:voice_of_vnr/FadeAnimation.dart';
import 'package:voice_of_vnr/SearchService.dart';
class SearchScreen extends StatefulWidget {
  SearchScreen({Key key, this.text}) : super(key: key);
  final String text;
  final String dispString = "";

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  initState(){
    speak();
  }
  FlutterTts tts = FlutterTts();
  speak() async{
    print('InTextToVoice');
    await tts.setLanguage("eng-US");
    await tts.setPitch(1);
    await tts.speak(widget.text);
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            )),
                      ),
                      FadeAnimation(
                          1.6,
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            padding: EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                query,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                FadeAnimation(
                      1.6,
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            widget.text,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,),
                          ),

                        ),
                      )),
              ],
            ),
          ),
        ));
  }
}
