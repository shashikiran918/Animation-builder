import 'package:flutter/material.dart';

class animated_screen extends StatefulWidget {
  @override
  _animated_screenState createState() => _animated_screenState();
}

class _animated_screenState extends State<animated_screen>
    with TickerProviderStateMixin {
  late Animation _containerRadiusAnimation,
      _containerSizeAnimation,
      _containerColorAnimation;
  late AnimationController _containerAnimationController;

  @override
  void initState() {
    super.initState();
    _containerAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));

    _containerRadiusAnimation = BorderRadiusTween(
        begin: BorderRadius.circular(100.0),
        end: BorderRadius.circular(0.0))
        .animate(CurvedAnimation(
        curve: Curves.ease, parent: _containerAnimationController));

    _containerSizeAnimation = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(
            curve: Curves.ease, parent: _containerAnimationController));

    _containerColorAnimation =
        ColorTween(begin: Colors.black, end: Colors.white).animate(
            CurvedAnimation(
                curve: Curves.ease, parent: _containerAnimationController));

    _containerAnimationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _containerAnimationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Screen'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _containerAnimationController,
          builder: (context, index) {
            return Container(
              transform: Matrix4.translationValues(
                  _containerSizeAnimation.value * width - 200.0, 0.0, 0.0),
              width: _containerSizeAnimation.value * height,
              height: _containerSizeAnimation.value * height,
              decoration: BoxDecoration(
                  borderRadius: _containerRadiusAnimation.value,
                  color: _containerColorAnimation.value),
            );
          },
        ),
      ),
    );
  }
}