import 'package:Day_1/homeScreen.dart';
import 'package:Day_1/profileScreen.dart';
import 'package:flutter/material.dart';

import 'SearchScreen.dart';
import 'notificationScreen.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget screen;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    setScreen(0);
  }

  setScreen(index) {
    if (index == 0) {
      setState(() {
        screen = HomeScreen();
        currentIndex = index;
      });
    } else if (index == 1) {
      setState(() {
        screen = SearchScreen();
        currentIndex = index;
      });
    } else if (index == 2) {
      setState(() {
        screen = NotificationScreen();
        currentIndex = index;
      });
    } else if (index == 3) {
      setState(() {
        screen = ProfileScreen();
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Abhishek"),
      ),
      body: Center(
        child: screen,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          notchMargin: 8,
          clipBehavior: Clip.antiAlias,
          color: Color(0xff1c1f26),
          shape: AutomaticNotchedShape(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)))),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.home_outlined,
                      color:
                          currentIndex == 0 ? Colors.white : Colors.grey[500],
                    ),
                    onPressed: () {
                      setScreen(0);
                    }),
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color:
                          currentIndex == 1 ? Colors.white : Colors.grey[500],
                    ),
                    onPressed: () {
                      setScreen(1);
                    }),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                ),
                IconButton(
                    icon: Icon(
                      Icons.bolt,
                      color:
                          currentIndex == 2 ? Colors.white : Colors.grey[500],
                    ),
                    onPressed: () {
                      setScreen(2);
                    }),
                IconButton(
                    icon: Icon(
                      Icons.person,
                      color:
                          currentIndex == 3 ? Colors.white : Colors.grey[500],
                    ),
                    onPressed: () {
                      setScreen(3);
                    }),
              ],
            ),
          )),
    );
  }
}
