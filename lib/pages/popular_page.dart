import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/news_model.dart';

class PopularPage extends StatefulWidget {
  const PopularPage({super.key});

  @override
  State<PopularPage> createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  int index = 0;

  List<Article> postList = [];

  Future<void> getNewsApi() async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2023-12-24&sortBy=publishedAt&apiKey=2eebeaa50122431cb3c2a603d3920bae"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      List<dynamic> articleData = data['articles'];
      setState(() {
        postList = articleData.map((e) => Article.fromJson(e)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    _widget(
                      image: 'assets/images/widget.jpg',
                      title: 'Here is What You Need To Know About Dumplings',
                      establisher: 'Jean Prangley',
                      time: '6',
                      theme: 'Food',
                      establisherAvatar: 'assets/images/avatar.jpg',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest News',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See More',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )),
            Expanded(
                flex: 2,
                child: FutureBuilder(
                  future: getNewsApi(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(postList[index].title.toString()),
                              Image.network(
                                  postList[index].urlToImage.toString()),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }

  Widget _widget({
    required String image,
    required String title,
    required String establisher,
    required String time,
    required String theme,
    required String establisherAvatar,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(35),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Container(
                  width: 60,
                  height: 60,
                  child: Center(
                    child: Icon(Icons.bookmark_add_outlined,
                        size: 30, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
          Container(
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 60,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(establisherAvatar),
                        radius: 15,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        establisher,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade600,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        '$time min read',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade600,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        height: 30,
                        width: 60,
                        child: Center(
                          child: Text(
                            theme,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildIndicators(),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget indiactor(bool isActive) {
    return AnimatedContainer(
      duration: Duration(microseconds: 5000),
      height: 6,
      width: 30,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: isActive ? Colors.black : Colors.grey.shade300,
      ),
    );
  }

  List<Widget> buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (index == i) {
        indicators.add(indiactor(true));
      } else {
        indicators.add(indiactor(false));
      }
    }
    return indicators;
  }
}
