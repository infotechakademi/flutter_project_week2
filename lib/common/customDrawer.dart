import 'package:flutter/material.dart';
import 'package:project7/pages/aboutus_page.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 50,
            child: Icon(
              Icons.person,
              size: 42,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FlatButton(
            onPressed: () {
              /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUs(),
                ),
              ); */

              Navigator.pushNamed(context, "/aboutus");
            },
            child: Text("About Us"),
          ),
          FlatButton(
              onPressed: () => showWarning(context), child: Text("Button 2")),
          FlatButton(
              onPressed: () => showWarning(context), child: Text("Button 3")),
          FlatButton(
              onPressed: () => showWarning(context), child: Text("Button 4")),
        ],
      ),
    );
  }

  showWarning(context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return SimpleDialog(
          children: [Text("Geçici olarak servis dışı")],
        );
      },
    );
  }
}
