import 'package:flutter/material.dart';
import 'package:productivity_app/Helper/helper_functions.dart';
import 'package:productivity_app/Screens/forgot_password.dart';
import 'package:productivity_app/Screens/home_page.dart';
import 'package:productivity_app/Screens/login_page.dart';
import 'package:productivity_app/Screens/onboaring_page.dart';
import 'package:productivity_app/Screens/splash_page.dart';
import 'package:productivity_app/Screens/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showOnBoarding = true;

  @override
  void initState() {
    setState(() {
      HelperFunctions.getOnBoardingSharedPreference().then((value) {
        showOnBoarding = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productivity App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "ProductSans"),
      //home: showOnBoarding ? OnBoardingPage() : HomePage(),
      home: ForgotPassword(),
    );
  }
}
