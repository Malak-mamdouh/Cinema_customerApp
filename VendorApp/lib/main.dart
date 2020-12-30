import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:addmovie/screens/addMovie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    DeleteMovie.tag: (context) => DeleteMovie(),
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
      home: DeleteMovie(),
      routes: routes,
    );
  }
}
