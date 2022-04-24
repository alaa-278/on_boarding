import 'package:flutter/material.dart';

import '../models/model.dart';

class SplashContent extends StatelessWidget {

  const SplashContent(this.item, {Key? key}) : super(key: key);
  final OnBoardingItem item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(item.title,style:
         const TextStyle(fontSize: 25,fontWeight: FontWeight.w800,color: Colors.red),),
          Text(item.description,style:  const TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
          Image.asset(item.image,height: MediaQuery.of(context).size.height*0.3,),
        ],
      ),
    );
  }
}