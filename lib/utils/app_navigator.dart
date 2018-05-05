import 'package:flutter/material.dart';

class AppNavigator {
  static void goToHome(BuildContext context) {
    //Navigator.pushNamed(context, "/home");
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/intro");
  }
}
