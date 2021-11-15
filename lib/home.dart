import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iotlamp/colour_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2d2f41),
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Transform.rotate(angle: pi / 2, child: ColourWidget()),
      ),
    );
  }
}
