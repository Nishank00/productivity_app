import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:productivity_app/Models/current_user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:productivity_app/Screens/home_page.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  CurrentUser _currentUser = CurrentUser();

  setUserDetails(User user) {
    return CurrentUser(currentUserUID: user.uid, emailAddress: user.email);
  }

  //SignIn
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return setUserDetails(user);
    } catch (e) {
      print("Error signIN: $e");
    }
  }

  //Signup
  Future createUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return setUserDetails(user);
    } catch (e) {
      print("SignUp: $e");
    }
  }

  //Forgot password
  Future restPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  //Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("sign out: $e");
    }
  }

  //Google SignIn
  Future<User> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result = await _auth.signInWithCredential(credential);
    User user = result.user;

    //Set the user details
    setUserDetails(user);

    if (result == null) {
      print("Oops, Something went wrong!");
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
