import 'package:addmovie/screens/AdminHome.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
     AdminHome.tag: (context) => AdminHome(),
  };
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'MOVIES APP',
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       primarySwatch: Colors.lightBlue,
       fontFamily: 'Langar',
     ),
     home:AdminHome(),
     routes: routes,
   );
  }
}