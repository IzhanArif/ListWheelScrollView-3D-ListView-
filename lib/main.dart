import 'package:flutter/material.dart';
import 'package:listwheelscrollview/3dlistview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: const Scaffold(
        body: ListVieww3D(),
      ),
    );
  }
}
