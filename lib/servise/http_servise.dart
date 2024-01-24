import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/image_model.dart';

class HTTPService {
  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8'
  };

  //HTTP APIS//
  static String API_LIST = "/photos";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts/";
  static String API_DELETE = "/posts/";

  /*HTTP Request*/

  static Future<String?> GET(String api, Map<String, String> params) async {
    var url = Uri.https(BASE, api, params);
    var response = await get(url,headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  //Http params//

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }


  //Api parsing

  static List<ImageModel> parseList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<ImageModel>.from(json.map((x) => ImageModel.fromJson(x)));
    return data;
  }
}
