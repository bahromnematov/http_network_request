import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_network_request/pages/detail_page.dart';
import 'package:http_network_request/pages/home_page.dart';
import 'package:http_network_request/pages/new_parsing_page.dart';
import 'package:http_network_request/pages/news_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }
}
