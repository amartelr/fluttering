import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttering/components/containers/sized_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[    
          const Text("Home Screen", style: const TextStyle(fontFamily: 'RobotoMono'),),        
           new  Image.network('https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true'),       
            sizedContainer(
              new CachedNetworkImage(
                imageUrl: "http://via.placeholder.com/350x200",
                placeholder: new CircularProgressIndicator(),
                errorWidget: new Icon(Icons.error),
                fadeOutDuration: new Duration(seconds: 1),
                fadeInDuration: new Duration(seconds: 3),
              ),
            ),
          ],
        )
      ),
    );
  }
}
