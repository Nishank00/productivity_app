import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16,right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50,),
                  Text("Welcome,",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                  SizedBox(height: 6,),
                  Text("Sign in to continue!",style: TextStyle(fontSize: 20,color: Colors.grey.shade400),),
                ],
              ),
              Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Email ID",
                      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
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
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
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
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 12,),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text("Forgot Password ?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    color: Color(0xffbc6d),
                    height: 50,
                    width: double.infinity,
                    child: InkWell(
                      child: Text("Login"),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: (){},
                      color: Colors.indigo.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("images/facebook.png",height: 18,width: 18,),
                          SizedBox(width: 10,),
                          Text("Connect with Facebook",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("I'm a new user.",style: TextStyle(fontWeight: FontWeight.bold),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          //return SignupPage();
                        }));
                      },
                      child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
