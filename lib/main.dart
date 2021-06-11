
import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: _AnimatedWidgetExample(),
    );
  }
}


class _AnimatedWidgetExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AnimatedWidgetExampleState();
}

class _AnimatedWidgetExampleState extends State<_AnimatedWidgetExample> with TickerProviderStateMixin {

  late AnimationController _controller;

  void initState() {
    super.initState();
    _controller = AnimationController(
      duration:  Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Builder'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: child,
            );
          },
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.teal,
            child:  Center(
              child: Text(
                'SHASHI',
                 style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
