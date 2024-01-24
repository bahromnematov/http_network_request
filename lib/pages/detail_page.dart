import 'package:flutter/material.dart';

import '../model/image_model.dart';
import '../servise/http_servise.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoading = false;
  List items = [];

  void _apiPostList() async {
    setState(() {
      isLoading = true;
    });
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
    _apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context,index){
              return itemPost(items[index]);
            },
          ),
          isLoading?
          Center(
            child: CircularProgressIndicator(),
          )
              :
          SizedBox()
        ],
      ),
    );
  }

  Widget itemPost(ImageModel model){
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       Card(
         child: Row(
           children: [
             Image.network(model.url,height: 60,width: 60,),
             SizedBox(width: 12,),
             Expanded(
               child: Text(model.title),
             )
           ],
         ),
       )
        ],
      ),
    );
  }


}
