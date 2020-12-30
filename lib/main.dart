import 'package:flutter/material.dart';
import 'package:productivity_app/Helper/helper_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:productivity_app/Screens/home_page.dart';
//import 'package:productivity_app/Screens/home_page.dart';
import 'package:productivity_app/Screens/journal_page.dart';
import 'package:productivity_app/Screens/login_page.dart';
import 'package:productivity_app/Screens/onboaring_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showOnBoarding;
  bool isUserLoggedIn;

  @override
  void initState() {
    setState(() {
      HelperFunctions.getOnBoardingSharedPreference().then((value) {
        if (value != null) {
          setState(() {
            showOnBoarding = value;
          });
        } else {
          setState(() {
            showOnBoarding = true;
          });
        }
      });

      HelperFunctions.getUserLoggedInSharedPreference().then((value) {
        setState(() {
          if (value != null) {
            setState(() {
              isUserLoggedIn = value;
            });
          } else {
            setState(() {
              isUserLoggedIn = false;
            });
          }
        });
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
      home: showOnBoarding ? OnBoardingPage() : isUserLoggedIn ? HomePage() : LoginPage(),
      //home: LoginPage(),
      //home:
      //home: (),
    );
  }
}
