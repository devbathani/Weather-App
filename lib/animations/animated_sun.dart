import 'package:flutter/material.dart';

class AnimatedSun extends StatefulWidget {
  const AnimatedSun({Key? key}) : super(key: key);

  @override
  _AnimatedSunState createState() => _AnimatedSunState();
}

class _AnimatedSunState extends State<AnimatedSun>
    with SingleTickerProviderStateMixin {
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
      child: Image.asset('images/moon.png'),
    );
  }
}
