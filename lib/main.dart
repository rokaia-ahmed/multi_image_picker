import 'package:flutter/material.dart';
import 'package:project1/Multi_image.dart';
import 'package:project1/profile.dart';
import 'package:project1/theme.dart';
import 'theme.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState (){
    super.initState();
    currentThem.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: CustomTheme.lightTheme ,
     darkTheme:ThemeData(
     brightness: Brightness.dark,
     ),
      debugShowCheckedModeBanner: false,
     themeMode: currentThem.currentThem ,
      home: MultiImage() ,
    );
  }
}

