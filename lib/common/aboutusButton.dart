import 'package:flutter/material.dart';
import 'package:project7/pages/aboutus_page.dart';

class AboutusButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Route aboutUsRoute = MaterialPageRoute(
      builder: (context) => AboutUs(),
    );

    return IconButton(
      icon: Icon(Icons.info_outline),
      onPressed: () {
        //Navigator.push(context, aboutUsRoute);
        Navigator.pushNamed(context, "/aboutus");
      },
    );
  }
}
