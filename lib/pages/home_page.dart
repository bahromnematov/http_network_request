import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:http_network_request/pages/popular_page.dart';
import '../model/post_model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  static final String id = 'home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _advancedDrawerController = AdvancedDrawerController();
  int index = 0;
  PageController _pageController = PageController(initialPage: 0);
  List<Post> postList = [];

  Future<List<Post>> getPostApi() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var i in data) {
        postList.add(Post.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.black.withOpacity(1)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      drawer: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    "  user?.name ?? ''",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text(
                    "  user?.email ?? " "",
                    style: TextStyle(fontSize: 18),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border(bottom: BorderSide.none),
                  ),
                  currentAccountPicture: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/user.jpg')),
                    ),
                  ),
                  currentAccountPictureSize: const Size(70, 70),
                ),
                ListTile(
                  onTap: () {
                    // Handle 'Home' tap
                  },
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                ),
                ListTile(
                  onTap: () {
                    // Handle 'Profile' tap
                  },
                  leading: const Icon(Icons.account_circle_rounded),
                  title: const Text('Profile'),
                ),
                ListTile(
                  onTap: () {
                    // Handle 'Favourites' tap
                  },
                  leading: const Icon(Icons.favorite),
                  title: const Text('Favourites'),
                ),
                ListTile(
                  onTap: () {
                    // Handle 'Settings' tap
                  },
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: const Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          key: _scaffoldKey, // Added a key to the Scaffold
          appBar: AppBar(
            bottom: const TabBar(
              indicatorColor: Colors.white,
              unselectedLabelStyle:
                  TextStyle(color: Colors.black, fontSize: 25),
              labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  text: 'Popular',
                ),
                Tab(
                  text: 'Trending',
                ),
                Tab(
                  text: 'Recent',
                ),
              ],
            ),
            actions: [
              InkWell(
                child: Image.asset('assets/images/search.jpg', width: 45),
              ),
              SizedBox(width: 10),
              InkWell(
                child: Image.asset('assets/images/icon.jpg', width: 30),
              ),
              SizedBox(width: 10),
            ],
            leading: InkWell(
              child: Image.asset('assets/images/menu.jpg', width: 30),
              onTap: () {
                _handleMenuButtonPressed();
              },
            ),
          ),
          body: TabBarView(
            children: [
              PopularPage(),
              Container(
                child: Center(
                  child: Text("Trending"),
                ),
              ),
              Container(
                child: Center(
                  child: Text("Trending"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
