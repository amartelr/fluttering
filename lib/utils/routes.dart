import 'package:flutter/widgets.dart';
import 'package:fluttering/views/home/home_index.dart';
import 'package:fluttering/views/splash/intro_page.dart';

var routes = <String, WidgetBuilder>{
  HomeIndex.routeName: (BuildContext context) => new HomeIndex(),
  IntroPage.routeName: (BuildContext context) => new IntroPage(),
};
