import 'package:flutter/material.dart';
import 'package:productivity_app/Screens/login_page.dart';
import 'package:productivity_app/Screens/onboaring_page.dart';
import 'package:productivity_app/Screens/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productivity App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "ProductSans"
      ),
      home: LoginPage(),
    );
  }
}
