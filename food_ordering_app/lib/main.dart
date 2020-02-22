import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_ordering_app/config/config.dart';
import 'package:food_ordering_app/pages/home.dart';
import 'package:food_ordering_app/pages/myaccount.dart';
import 'package:food_ordering_app/pages/offers.dart';
import 'package:food_ordering_app/pages/orders.dart';
import 'package:food_ordering_app/pages/search.dart';

void main() {
  runApp(
    App()
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: "Food Ordering App",
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int _currentPageIndex = 0;

  var _pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hungry Now"),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),

          IconButton(
            icon: Icon(Icons.local_offer),
            onPressed: (){},
          ),

        ],
      ),
      body: PageView(
        controller: _pageViewController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (i) {
          setState(() {
            _currentPageIndex = i;
          });
        },
        children: <Widget>[
          Home(),
          Search(),
          Offers(),
          Orders(),
          MyAccount(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (i){
          setState(() {
            _currentPageIndex = i;
            _pageViewController.animateToPage(
              i,
              curve: ElasticInCurve(),
              duration: Duration(
                milliseconds: 300,
              ),
            );
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            title: Text("Offers"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_mall),
            title: Text("Orders"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("My Account"),
          ),
        ],
      ),
    );
  }
}