import 'package:architecture_latest/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:architecture_latest/common/registry/injection_registry.dart'
    as injector;

void main() {
  injector.initiateInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
