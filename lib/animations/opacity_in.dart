import 'package:flutter/material.dart';

class OpacityIn extends StatefulWidget {
  const OpacityIn({super.key, required this.child, required this.delay});

  final Widget child;
  final double delay;

  @override
  State<OpacityIn> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<OpacityIn>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: (500 * widget.delay).round()),
        vsync: this);

    animation = Tween<double>(begin: 0, end: 1)
        // .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut))
        .animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
