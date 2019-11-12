import 'package:flutter/material.dart';
import 'package:flutter_app/dashboard.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Dashboard',
      theme: new ThemeData(primarySwatch: Colors.blueGrey),
      // home: new Dashboard(title: 'Flutter Demo Home Page'),
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}