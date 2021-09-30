// @dart=2.9
import 'package:flutter/material.dart';
import 'package:mycovid19updates/dataSource.dart';
import 'package:mycovid19updates/homePage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Circular',
        primaryColor: primaryBlack,
        brightness: Brightness.light,
      ),
      home: HomePage(),
    );
  }
}
