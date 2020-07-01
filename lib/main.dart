import 'package:flutter/material.dart';

import 'HomePage.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Employee app",
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
