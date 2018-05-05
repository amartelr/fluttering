import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttering/components/themes/default_theme.dart';
import 'package:fluttering/utils/routes.dart';
import 'package:fluttering/views/splash/splash_page.dart';


void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fluttering",
      home: new SplashPage(),
      routes: routes,
      theme: defaultTheme,
    );
  }
}
