import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:task5/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task5/models/model.dart';
import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _controller.repeat();
   if(prefs.getBool(Constant.haveSeenBefore) ==true)
   {
     Navigator.pushReplacement(context,
         MaterialPageRoute(builder: (context) =>  LoginScreen()));
   }
   else{
     Navigator.pushReplacement(context,
         MaterialPageRoute(builder: (context) =>  OnBoardingScreen()));

   }
   {
     Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>  OnBoardingScreen()));
    });
   }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScaleTransition(
        scale: _animation,
        child: Center(
            child: Image.asset(
          'assets/images/Food_Delivery.png',
          width: MediaQuery.of(context).size.width,
        )),
      ),
    );
  }
}
