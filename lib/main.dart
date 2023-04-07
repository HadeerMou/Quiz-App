import 'package:flutter/material.dart';
import 'package:quiz/Homescreen.dart';
import 'package:get/get.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: HomeScreen(),
      /*home: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.orange),
   
    ),);
      theme: ThemeData(
        primarySwatch: Colors.blue,*/
      );
  }
}