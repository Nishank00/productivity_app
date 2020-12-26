import 'package:flutter/material.dart';
import 'package:productivity_app/Services/auth_services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  AuthServices _authServices = AuthServices();

  var _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                  left: 10.0,
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Please enter your Email-ID, we will send you reset link shortly",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email ID",
                labelStyle:
                    TextStyle(fontSize: 14, color: Colors.grey.shade400),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 50,
            width: double.infinity,
            child: FlatButton(
              onPressed: () {
                _authServices.restPassword(_emailController.text);
                Fluttertoast.showToast(msg: "Email will be sent shortly");
              },
              padding: EdgeInsets.all(0),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xffff5f6d),
                      Color(0xffff5f6d),
                      Color(0xffffc371),
                    ],
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  constraints:
                      BoxConstraints(maxWidth: double.infinity, minHeight: 50),
                  child: Text(
                    "Send mail",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
