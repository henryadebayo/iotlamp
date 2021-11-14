import 'dart:math';

import 'package:flutter/material.dart';

class ColourWidget extends StatefulWidget {
  const ColourWidget({Key key}) : super(key: key);

  @override
  _ColourWidgetState createState() => _ColourWidgetState();
}

class _ColourWidgetState extends State<ColourWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 300,
        child: CustomPaint(
          painter: ClockPainter(),
        ));
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();
  //

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    //INNER FILL
    var fillBrush = Paint()..color = Color(0xff444974);

    //OUTLINE
    var outLine = Paint()
      ..color = Colors.grey
      //  style = PaintingStyle.stroke
      ..strokeWidth = 16.0;

    //centerFill
    var centerFill = Paint()..color = Colors.grey;

    //second handbrush
    var secondhandbrush = Paint()
      ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16.0;

    //minute handbrush
    var minutehandbrush = Paint()
      ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16.0;

    //hour handbrush
    var hourhandbrush = Paint()
      ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16.0;

    //INNER FILL
    canvas.drawCircle(center, radius - 40, fillBrush);

    //OUTLINE
    canvas.drawCircle(center, radius - 40, outLine);

    //CENTER FILL
    canvas.drawCircle(center, 16, centerFill);

    var hourX = centerX + 80 * cos(90 * pi / 180);
    var hourY = centerY + 80 * cos(90 * pi / 180);

    //hour
    canvas.drawLine(center, Offset(hourX, hourY), hourhandbrush);

    var minX = centerX + 80 * cos(90 * pi / 180);
    var minY = centerY + 80 * cos(90 * pi / 180);
    //min
    canvas.drawLine(center, Offset(minX, minY), minutehandbrush);

    //sec
    canvas.drawLine(center, Offset(100, 100), secondhandbrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
