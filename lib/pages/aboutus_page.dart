import 'package:flutter/material.dart';
import 'package:project7/common/customDrawer.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  PageController pageController = PageController(initialPage: 0);
  List<Widget> pages;

  @override
  void initState() {
    pages = [
      Container(
        color: Colors.amber,
        alignment: Alignment.center,
        child: Text("Kuruluş"),
      ),
      Container(
        color: Colors.teal,
        alignment: Alignment.center,
        child: Text("Kadro"),
      ),
      Container(
        color: Colors.redAccent,
        alignment: Alignment.center,
        child: Text("Vizyon"),
      ),
      Container(
        color: Colors.purple,
        alignment: Alignment.center,
        child: Text("Misyon"),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: pages,
            onPageChanged: (int curPageIndex) {
              print("Current Page: $curPageIndex");
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: IconButton(
              icon: Icon(Icons.home),
              iconSize: 48,
              onPressed: () {
                pageController.animateTo(0,
                    duration: Duration(seconds: 1), curve: Curves.easeInOut);
              },
            ),
          ),
        ],
      ),
    );
  }
}
