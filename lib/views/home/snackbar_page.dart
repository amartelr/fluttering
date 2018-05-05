import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SnackBarPage extends StatelessWidget {
  _launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new RaisedButton(
        onPressed: () {
          final snackBar = new SnackBar(
            content: new Text('Yay! flutter.io!'),
            action: new SnackBarAction(
              label: 'Show Flutter homepage',
              onPressed: _launchURL,
            ),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: new Text('Show SnackBar'),
      ),
    );
  }
}
