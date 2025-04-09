import 'package:fisheryproject/ui/dashboard.dart';
import 'package:fisheryproject/ui/fishery_param.dart';
import 'package:fisheryproject/ui/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: FisheryParam(),
    );
  }
}


