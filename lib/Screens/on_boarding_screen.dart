import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task5/main.dart';
import '../models/model.dart';
import '../widgets/widget.dart';


class OnBoardingScreen extends StatefulWidget {
   OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
   int currentindex = 0;
   final PageController controller = PageController();
   @override
  void initState() {
           prefs.setBool(Constant.haveSeenBefore,true);
           super.initState();
  }
  @override
  Widget build(BuildContext context) {

    Widget buildDot(int index) {
      return AnimatedContainer(
        duration: const Duration(microseconds: 200),
        height: 6,
        width: index == currentindex ? 20 : 6,
        child: Container(
          height: 6,
          width: 20,
          decoration: BoxDecoration(
            color: index == currentindex ? Colors.amber : Colors.red,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const SizedBox(height: 15),
            Opacity(
              opacity:currentindex!=Constant.boardingItems.length-1?1:0,
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Align(
                    alignment: Alignment.topRight,
                    child:
                    TextButton(onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>const LoginScreen()));
                    }, child: const
                    Text('Skip',style: TextStyle(color: Colors.red),))),
              ),
            ),
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: controller,
                onPageChanged: (int index) {
                  setState(() {
                    currentindex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return SplashContent(Constant.boardingItems[index]);
                },
                itemCount: Constant.boardingItems.length,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          Constant.boardingItems.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: buildDot(index),
                              )))
                ],
              ),
            ),
            CupertinoButton(
                color: Colors.red, child: currentindex==Constant.boardingItems.length-1?const Text('Start'):const Text('Next'),
                onPressed: () {
                  if(currentindex==Constant.boardingItems.length-1){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>const LoginScreen()));

                  }
                  setState(() {
                    currentindex++;
                    controller.animateToPage(currentindex, duration: const Duration(microseconds: 100), curve: Curves.elasticIn);
                  });
            }),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
