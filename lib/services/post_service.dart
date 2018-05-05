import 'dart:async';
import 'dart:convert';

import 'package:fluttering/model/post.dart';
import 'package:http/http.dart' as http;



Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');
  final responseJson = json.decode(response.body);

  return new Post.fromJson(responseJson);
}
