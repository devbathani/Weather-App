import 'package:flutter/material.dart';

class AnimatedSunandMoon extends StatefulWidget {
  const AnimatedSunandMoon({Key? key}) : super(key: key);

  @override
  _AnimatedSunandMoonState createState() => _AnimatedSunandMoonState();
}

class _AnimatedSunandMoonState extends State<AnimatedSunandMoon>
    with SingleTickerProviderStateMixin {
  var sun = 'images/sun.gif';
  var moon = 'images/moon.png';

  Widget Sun() {
    return Image.asset(sun);
  }

  Widget Moon() {
    return Image.asset(moon);
  }

  var theme;

  Widget change() {
    if (DateTime.now().hour >= 6 && DateTime.now().hour <= 18) {
      setState(() {
        Sun();
        theme = Sun();
      });
    } else {
      setState(() {
        theme = Moon();
      });
    }
    return theme;
  }

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: const Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: change(),
    );
  }
}
