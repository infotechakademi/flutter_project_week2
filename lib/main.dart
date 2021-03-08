import 'package:flutter/material.dart';
import 'package:project7/pages/aboutus_page.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: HomePage(),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/aboutus": (context) => AboutUs(),
      },
      onGenerateRoute: (RouteSettings routeSettings) {
        List<String> textList = routeSettings.name.split("/");
        if (textList[1] == "home") {
          return MaterialPageRoute(builder: (context) {
            if (textList[2] != null || textList[2] != "") {
              return HomePage(userName: textList[2]);
            } else {
              return HomePage();
            }
          });
        } else if (textList[1] == "aboutus") {
          return MaterialPageRoute(builder: (context) => AboutUs());
        }
      },

      onUnknownRoute: (RouteSettings routeSettings) => MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text("Sayfa bulunamadı"),
          ),
        ),
      ),
    );
  }
}
