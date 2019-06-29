import 'package:flutter/material.dart';
import 'package:flutter_reader/routes/categories_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new CategoryRoute(),
    );
  }
}