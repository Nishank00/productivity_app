import 'package:flutter/material.dart';
import 'package:productivity_app/Helper/helper_functions.dart';
import 'package:productivity_app/Screens/home_page.dart';
import 'package:productivity_app/Screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isUserLoggedIn = false;

  getUserLoginStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isUserLoggedIn =
        preferences.getBool(HelperFunctions.sharedPreferenceUserLoggedInKey);

    if (isUserLoggedIn) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  void initState() {
    getUserLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Loading..."),
      ),
    );
  }
}
