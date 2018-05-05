import 'package:flutter/material.dart';
import 'package:fluttering/utils/drawer_item.dart';
import 'package:fluttering/views/home/fetchdata_page.dart';
import 'package:fluttering/views/home/home_page.dart';
import 'package:fluttering/views/home/jsonback_page.dart';
import 'package:fluttering/views/home/location_page.dart';
import 'package:fluttering/views/home/login_page.dart';
import 'package:fluttering/views/home/snackbar_page.dart';
import 'package:fluttering/views/home/tabbar_page.dart';


class HomeIndex extends StatefulWidget {
  static const routeName = "/home";
  

  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("SnackBarDemo", Icons.space_bar),
    new DrawerItem("TabBarDemo", Icons.tab),
    new DrawerItem("FetchDataPage", Icons.network_wifi),
    new DrawerItem("Json Background", Icons.settings_remote),
    new DrawerItem("Location", Icons.location_searching),
    new DrawerItem("Login Page", Icons.supervised_user_circle),
  ];

  @override
  HomeIndexState createState() {    
    return new HomeIndexState();
  }
}

class HomeIndexState extends State<HomeIndex>  {
  int _selectedDrawerIndex = 0;

//  bool showFirst = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
  //  animCtrl.dispose();
    super.dispose();
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomePage();
      case 1:
        return new SnackBarPage();
      case 2:
        return new TabBarPage();
      case 3:
        return new FetchDataPage();
      case 4:
        return new JsonBackPage();        
      case 5:
         return new LocationPage();
      case 6:
          return new LoginPage();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Alfredo Martel"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
