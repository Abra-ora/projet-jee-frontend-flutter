// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// // import 'package:studi_kasus/login_page.dart';
// import './screens/register.dart';
// import './screens/login.dart';
// //import 'splash_screen.dart';
// import 'flask_api.dart';
// import 'widgets/ca';

// void main() {
//   // flaskApi.getGraphs();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         fontFamily: 'Lato',
//       ),
//       debugShowCheckedModeBanner: false,
//       home: LoginPage(),
//       // home: RegisterPage(),
//     );
//   }
// }

// ignore_for_file: missing_return, unused_label

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

