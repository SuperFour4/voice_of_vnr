
import 'package:flutter/material.dart';
import 'package:voice_of_vnr/search_screen.dart';

import 'FadeAnimation.dart';
import 'SearchService.dart';

class LoadingScreen extends StatefulWidget {
  @override
  LoadingScreen({Key key, this.text }) : super(key: key);
  final String text;
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String value="No Data found";
  initState() {
    initiateFun(widget.text);
  }
  void initiateFun(String textVal) async{
    setState(() async{
      value = await initiateSearch(widget.text);
    });
  }
  Map map;
  initiateSearch(valueParam) async {
    print("hello hie");
    await SearchService().getData(valueParam).then((value){
      for(var i in value.docs){
        setState((){
          map = i.data();
          print(map['value']);
        });
      }
    });
    if(map['searchKey'] == widget.text){
      print('inside if map');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchScreen(text: map['value'],)),
      );
    }else{
      print('inside else map');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchScreen(text: 'No Data found',)),
      );
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
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text(
                                  'Loading Data',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),

                              ),
                            )),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
