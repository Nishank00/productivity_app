import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  List<PageViewModel> listPages = [
    PageViewModel(
      title: "Page 1",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Image.asset("assets/organize.png")),
    ),
    PageViewModel(
      title: "Page 2",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Image.asset("assets/workout.png"),
    ),
    PageViewModel(
      title: "Page 3",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Image.asset("assets/relax.png"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff9f9f9),
        body: IntroductionScreen(
          pages: listPages,
          done: Text("Done"),
          skip: Text("Skip"),
          onDone: () {},
          showNextButton: true,
          showSkipButton: true,
        ));
  }
}
