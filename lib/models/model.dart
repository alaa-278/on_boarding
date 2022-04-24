import 'package:flutter/material.dart';

class OnBoardingItem {
  late String image;
  late String description;
  late String title;

  OnBoardingItem(
      {required this.title, required this.image, required this.description});
}


abstract class Constant{
  static const String haveSeenBefore= "haveSeenBefore";
  static List<OnBoardingItem> boardingItems = [
    OnBoardingItem(
        image: 'assets/images/On_Boarding_Screen1.jpg', description: 'Hope you like Our Restaurant', title: 'Welcome to Us'),
    OnBoardingItem(
        image: 'assets/images/On_Boarding_Screen2.jpg', description: 'The food is very delicious hope you like it', title: 'Welcome to Us'),
    OnBoardingItem(
        image: 'assets/images/On_Boarding_Screen3.jpg', description: 'And with the lowest prices', title: 'Welcome to Us'),
  ];
}
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    body: Text('Aalll'),
    );
  }
}


