import 'package:flutter/material.dart';
import 'package:fluttering/model/post.dart';
import 'package:fluttering/services/post_service.dart';

class FetchDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new FutureBuilder<Post>(
          future: fetchPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            // By default, show a loading spinner
            return new CircularProgressIndicator();
          }),
    );
  }
}
