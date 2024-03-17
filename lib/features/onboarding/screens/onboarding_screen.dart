import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scenery_app/animations/fade_in.dart';
import 'package:scenery_app/animations/opacity_in.dart';
import 'package:scenery_app/features/home/screens/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _scaleAnimationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 1.3).animate(CurvedAnimation(
      parent: _scaleAnimationController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimationController.addListener(() {
      setState(() {});
    });

    _scaleAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _scaleAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _scaleAnimationController.forward();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scaleAnimationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedScale(
              scale: _scaleAnimation.value,
              duration: const Duration(seconds: 3),
              child: Image.asset(
                'assets/images/5_morning.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            height: MediaQuery.sizeOf(context).height * .7,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 40,
            top: 100,
            right: 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OpacityIn(
                  delay: 1.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          shadows: [
                            BoxShadow(
                              blurRadius: 20,
                              spreadRadius: 100,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Retree",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              blurRadius: 60,
                              spreadRadius: 100,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "A place for you to meet like minded \npeople for your next retreat",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              blurRadius: 30,
                              spreadRadius: 100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                FadeInAnimation(
                  delay: 2,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF032133),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.sensor_occupied),
                    label: const Text("Get Started"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
