import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/valyuta_model.dart';

class NewParsingPage extends StatefulWidget {
  const NewParsingPage({super.key});

  @override
  State<NewParsingPage> createState() => _NewParsingPageState();
}

class _NewParsingPageState extends State<NewParsingPage> {
  List<ValyutaModel> postList = [];

  Future<List<ValyutaModel>> getPostApi() async {
    var response = await http
        .get(Uri.parse("https://cbu.uz/uz/arkhiv-kursov-valyut/json/"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var i in data) {
        postList.add(ValyutaModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Valyuta Kurs"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(postList[index].code.toString()),
                          Text(postList[index].nominal.toString()),
                          Text(postList[index].ccyNmEn.toString()),
                          Text(postList[index].date.toString()),
                          Text(postList[index].rate.toString()),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
