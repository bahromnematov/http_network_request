import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_network_request/model/news_model.dart';
import 'package:http_network_request/model/post_model.dart';
import 'package:http_network_request/servise/http_servise.dart';
import 'package:http_network_request/servise/log_service.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var items = [];
  var isLoading = false;

  void apiPostList() async {
    isLoading = true;
    var response =
        await HTTPService.GET(HTTPService.API_LIST, HTTPService.paramsEmpty());
    if (response != null) {
      setState(() {
        isLoading = false;
        items = HTTPService.parseList(response);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx,index){
              return itemPost(items[index]);
            },
          ),
          isLoading?
              Center(
                child: CircularProgressIndicator(),
              )
              :Stack()
        ],
      )
    );
  }

  Widget itemPost(Article post){
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title,style: TextStyle(fontSize: 24,color: Colors.black),),
          SizedBox(height: 6,),
          Text(post.content),
        ],
      ),
    );
  }




}
