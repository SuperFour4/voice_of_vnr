import 'package:flutter/material.dart';
import 'package:voice_of_vnr/FadeAnimation.dart';
import 'package:voice_of_vnr/Query_page.dart';
import 'package:alan_voice/alan_voice.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserPage(),
    )
);

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String command = "Welcome to VNR Vignana Jyothi";
  String sdkKey = "f52106f34ff2f09ec85601bccf1b955e2e956eca572e1d8b807a3e2338fdd0dc/stage";
  voiceSearch(){
    AlanVoice.addButton(sdkKey, buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT);
    AlanVoice.callbacks.add((command) => _handleCommand(command.data));
  }
  _handleCommand(Map<String, dynamic> response) {
    switch (response["command"]) {
      case "home":
        Navigator.pushNamed(context, 'homepage');
        break;
      case "branch":
        Navigator.pushNamed(context, 'branchpred');
        break;
      case "calendar":
        Navigator.pushNamed(context, 'calendar');
        break;
      case "disable":
        AlanVoice.deactivate();
        break;
      default:
        print("no match found");
        break;
    }
  }
  @override
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
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(1, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-1.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.3, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-2.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.5, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/clock.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top: 90),
                          child: Center(
                            child: Text("Welcome to Voice Of VNR", style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column
                    (
                    children: <Widget>[
                      FadeAnimation(1.8, Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(
                                      color: Colors.grey[100]))
                              ),
                              child: FadeAnimation(2, Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(143, 148, 251, 1),
                                          Color.fromRGBO(143, 148, 251, .6),
                                        ]
                                    )
                                ),
                                child: Center(
                                  child: TextButton(
                                      onPressed: () {
                                        command = "Voice command activated";
                                        voiceSearch();
                                      },
                                      child: Text("Search",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),)),
                                ),
                              )),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(
                                      color: Colors.grey[100]))
                              ),
                              child: FadeAnimation(2, Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(143, 148, 251, 1),
                                          Color.fromRGBO(143, 148, 251, .6),
                                        ]
                                    )
                                ),
                                child: Center(
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, 'branchpred');
                                      },
                                      child: Text("BranchPrediction",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),)),
                                ),
                              )),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(
                                      color: Colors.grey[100]))
                              ),
                              child: FadeAnimation(2, Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(143, 148, 251, 1),
                                          Color.fromRGBO(143, 148, 251, .6),
                                        ]
                                    )
                                ),
                                child: Center(
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, 'calendar');
                                      },
                                      child: Text("Calendar",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),)),
                                ),
                              )),
                            ),
                          ],
                        ),
                      )),
                      SizedBox(height: 30,),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );;
  }
}
