// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../model/news_model.dart';
//
//
// class NewsScreen extends StatefulWidget {
//   @override
//   _NewsScreenState createState() => _NewsScreenState();
// }
//
// class _NewsScreenState extends State<NewsScreen> {
//   List<Article> articles = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchNews();
//   }
//
//   Future<void> fetchNews() async {
//     final response = await http.get(
//       Uri.parse(
//           'https://newsapi.org/v2/everything?q=tesla&from=2023-12-13&sortBy=publishedAt&apiKey=2eebeaa50122431cb3c2a603d3920bae'),
//     );
//
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = json.decode(response.body);
//       List<dynamic> articlesData = data['articles'];
//
//       setState(() {
//         articles = articlesData.map((article) => Article.fromJson(article)).toList();
//       });
//     } else {
//       throw Exception('Failed to load news');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tesla News'),
//       ),
//       body: ListView.builder(
//         itemCount: articles.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: EdgeInsets.all(8.0),
//             child: ListTile(
//               title: Text(articles[index].title),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   if (articles[index].urlToImage != null)
//                     Image.network(
//                       articles[index].urlToImage!,
//                       height: 100,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   SizedBox(height: 8),
//                   Text(articles[index].publishedAt),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// // class Article {
// //   final String title;
// //   final String publishedAt;
// //   final String? urlToImage;
// //
// //   Article({
// //     required this.title,
// //     required this.publishedAt,
// //     this.urlToImage,
// //   });
// //
// //   factory Article.fromJson(Map<String, dynamic> json) {
// //     return Article(
// //       title: json['title'],
// //       publishedAt: json['publishedAt'],
// //       urlToImage: json['urlToImage'],
// //     );
// //   }
// // }
