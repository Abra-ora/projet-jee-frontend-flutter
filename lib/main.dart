
import 'package:flutter/material.dart';
import './widgets/card.dart';
import 'flask_api.dart';
import './screens/home.dart';
import 'screens/login.dart';

void main() {
  // flaskApi.getGraphs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
    //   home: MyHomePage(
    //     title: 'K-means: Data visualization',),
    // );
  }
}

