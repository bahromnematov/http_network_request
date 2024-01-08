import 'package:flutter/material.dart';
import 'package:http_network_request/model/post_model.dart';
import 'package:http_network_request/servise/log_service.dart';
import 'package:http_network_request/servise/network_servise.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var post=Post(id: 1, title: "home", body: "Flutter",userId: 1);

  void _apiPostList(){
    NetworkService.GET(NetworkService.API_LIST, NetworkService.emptyParams()).then((value) => {
      LogService.i(value.toString())
    });
  }

  void _apiPostCreate(){
    NetworkService.POST(NetworkService.API_CREATE, NetworkService.createParams(post)).then((value) => {

    });
  }

  void _apiPostUpdate(){
    NetworkService.PUT(NetworkService.API_UPDATE+post.id.toString(), NetworkService.paramsUpdate(post)).then((value) => {

    });
  }

  void _apiPostDelete(){
    NetworkService.DEL(NetworkService.API_DELETE+post.id.toString(), NetworkService.emptyParams()).then((value) => {

    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _apiPostList();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("HTTP",style: TextStyle(color: Colors.red),),
      ),
    );
  }
}
