import 'package:flutter/material.dart';

class TabBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 4,
        child: new Scaffold(
            appBar: new AppBar(
              bottom: new TabBar(
                tabs: [
                  new Tab(text: "MainAxisAlignment"),
                  new Tab(text: "CrossAxisAlignment"),
                  new Tab(text: "MainAxisSize"),
             //     new Tab(text: "Expanded"),
                  new Tab(text: "Constraints"),
                ],
              ),
            ),
            body: new TabBarView(
              children: [
                new Row /*or Column*/ (
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Icon(Icons.star, size: 50.0),
                    new Icon(Icons.star, size: 50.0),
                    new Icon(Icons.star, size: 50.0),
                  ],
                ),
                new Row /*or Column*/ (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Icon(Icons.star, size: 50.0),
                    new Icon(Icons.star, size: 200.0),
                    new Icon(Icons.star, size: 50.0),
                  ],
                ),
                new Row /*or Column*/ (
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Icon(Icons.star, size: 50.0),
                    new Icon(Icons.star, size: 50.0),
                    new Icon(Icons.star, size: 50.0),
                  ],
                ),
                // new Row(
                //   children: <Widget>[
                //     new Expanded(
                //       child: new Container(
                //         decoration: const BoxDecoration(color: Colors.red),
                //       ),
                //       flex: 3,
                //     ),
                //     new Expanded(
                //       child: new Container(
                //         decoration: const BoxDecoration(color: Colors.green),
                //       ),
                //       flex: 2,
                //     ),
                //     new Expanded(
                //       child: new Container(
                //         decoration: const BoxDecoration(color: Colors.blue),
                //       ),
                //       flex: 1,
                //     ),
                //   ],
                // ),
                new ConstrainedBox(
                  constraints: new BoxConstraints(
                    minWidth: double.infinity,
                    maxWidth: double.infinity,
                    minHeight: 300.0,
                    maxHeight: 300.0,
                  ),
                  child: const Card(
                    child: const Text('Hello World!'),
                    color: Colors.yellow,
                  ),
                ),
              ],
            )));
  }
}
