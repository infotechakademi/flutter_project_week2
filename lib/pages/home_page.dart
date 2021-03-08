import 'package:flutter/material.dart';
import 'package:project7/common/aboutusButton.dart';
import 'package:project7/common/customDrawer.dart';
import 'aboutus_page.dart';

enum PageDesign {
  list,
  grid,
}

class HomePage extends StatefulWidget {
  final String userName;
  HomePage({this.userName});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageDesign currentPageDesign = PageDesign.list;

  List<String> memberList = [
    "user1",
    "user2",
    "user3",
    "user4",
    "user5",
    "user6",
    "user7",
    "user8",
    "user9",
    "user10",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade300,
      appBar: AppBar(
        title: Text(widget.userName),
        actions: [
          AboutusButton(),
          switchDesignButton(),
        ],
      ),
      drawer: CustomDrawer(),
      body: (currentPageDesign == PageDesign.list)
          ? listViewWidget()
          : gridViewWidget(),
    );
  }

  IconButton switchDesignButton() {
    return IconButton(
      icon: Icon(Icons.swap_horiz_outlined),
      onPressed: () {
        setState(
          () {
            currentPageDesign = (currentPageDesign == PageDesign.list)
                ? PageDesign.grid
                : PageDesign.list;
          },
        );
      },
    );
  }

  int columnCount(Orientation orientation) {
    if (orientation == Orientation.portrait) {
      return 3;
    } else {
      return 5;
    }
  }

  gridViewWidget() {
    // orientation of device
    print(MediaQuery.of(context).orientation);
    //
    return OrientationBuilder(
      builder: (context, Orientation orientation) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columnCount(orientation)),
          itemCount: memberList.length,
          itemBuilder: (context, index) {
            return gridItem(index);
          },
        );
      },
    );
  }

  gridItem(int _index) {
    return Card(
      child: GridTile(
        child: Icon(
          Icons.person,
          size: 48,
        ),
        footer: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            memberList[_index],
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  listViewWidget() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        if (index == 0) {
          return Divider();
        } else {
          return SizedBox();
        }
      },
      itemCount: memberList.length,
      itemBuilder: (context, int index) {
        return listItem(index);
      },
    );
  }

  listItem(int _index) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.person),
        trailing: RotatedBox(
          quarterTurns: 2,
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text(memberList[_index]),
      ),
    );
  }
}
