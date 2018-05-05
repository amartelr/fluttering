import 'package:flutter/material.dart';
import 'package:fluttering/components/gridviews/photolist.dart';
import 'package:fluttering/model/photo.dart';
import 'package:fluttering/services/photo_service.dart';
import 'package:http/http.dart' as http;


class JsonBackPage extends StatelessWidget {
    final List<Photo> photos;

  const JsonBackPage({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<List<Photo>>(
        future: fetchPhotos(new http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new PhotosList(photos: snapshot.data)
              : new Center(child: new CircularProgressIndicator());
        },
    );
  }
}