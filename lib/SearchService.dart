import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
String query;
class SearchService{
  getData(String value) async{
    query=value;
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance.collection('vnrvjiet').where('searchKey',isEqualTo: value).get();
  }
 /* searByName(String searchField){
    var ret = FirebaseFirestore.instance.collection('vnrvjiet')
        .where('searchKey',isEqualTo: searchField).get();
    print("hello");
    return ret;
  }*/
}