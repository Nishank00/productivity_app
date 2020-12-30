import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:productivity_app/Helper/helper_functions.dart';
import 'package:productivity_app/Models/current_user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:productivity_app/Screens/home_page.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  setUserDetails(User user) {
    return CurrentUser(currentUserUID: user.uid, emailAddress: user.email);
  }

  //SignIn
  Future signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      if (result == null) {
        Fluttertoast.showToast(msg: "Oops, something went wrong!");
      } else {
        HelperFunctions.saveUserEmailSharedPreference(result.user.email);
        HelperFunctions.saveUserLoggedInSharedPreference(true);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }

      return setUserDetails(user);
    } catch (e) {
      print("Error signIN: $e");
    }
  }

  //Signup
  Future createUserWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    //* Login the user, and set the shared preferences...
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      if (result == null) {
        Fluttertoast.showToast(msg: "Oops, something went wrong");
      } else {
        HelperFunctions.saveUserEmailSharedPreference(result.user.email);
        HelperFunctions.saveUserLoggedInSharedPreference(true);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }

      return setUserDetails(user);
    } catch (e) {
      print("SignUp: $e");
    }
  }

  //Forgot password
  Future restPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("resetPassword: $e");
    }
  }

  //Sign Out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      HelperFunctions.saveUserLoggedInSharedPreference(false);
    } catch (e) {
      print("sign out: $e");
    }
  }

  //Google SignIn
  Future<void> signInWithGoogle(BuildContext context) async {
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
      Fluttertoast.showToast(msg: "Oops, Something went wrong!");
    } else {
      HelperFunctions.saveUserLoggedInSharedPreference(true);
      HelperFunctions.saveUserEmailSharedPreference(result.user.email);
      print(result.user.email);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
