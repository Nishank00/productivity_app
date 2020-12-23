import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:productivity_app/Screens/home_page.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  List<PageViewModel> listPages = [
    PageViewModel(
      body: ' "A good system shortens the road to the goal." ',
      title: "Organize",
      image: Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Image.asset("assets/images/organize.png")),
    ),
    PageViewModel(
      title: "Workout",
      body:
          ' "All you need is the plan, the road map, and the courage to press on to your destination." ',
      image: Image.asset("assets/images/workout.png"),
    ),
    PageViewModel(
      title: "Relax",
      body: ' "Sometimes the most productive thing you can do is relax" ',
      image: Image.asset("assets/images/relax.png"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffaf9f9),
        body: IntroductionScreen(
          pages: listPages,
          done: Text("Done"),
          skip: Text("Skip"),
          onDone: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          showNextButton: true,
          showSkipButton: true,
        ));
  }
}
