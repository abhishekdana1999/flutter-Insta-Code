import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double value = 0;
  Widget appbar = Center(
    child: Text("Home"),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.purple[400], Colors.blue[800]],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
          SafeArea(
            child: Container(
              width: 200.0,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(
                              'https://yt3.ggpht.com/yti/ANoDKi7dwCPIPAoRSAehGDhIBtw5Lvsnikj_ZfiJsemrtv4=s88-c-k-c0x00ffffff-no-rj-mo'),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Abhishek Dana",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          print("Home");
                          setState(() {
                            appbar = Center(
                              child: Text("Home"),
                            );
                          });
                        },
                        leading: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Home",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          print("Player");
                          setState(() {
                            appbar = Center(
                              child: Text("Player"),
                            );
                          });
                        },
                        leading: Icon(
                          Icons.play_circle_fill_sharp,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Player",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          print("Profile");
                          setState(() {
                            appbar = Center(
                              child: Text("Profile"),
                            );
                          });
                        },
                        leading: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Profile",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          print("Settings");
                          setState(() {
                            appbar = Center(
                              child: Text("Settings"),
                            );
                          });
                        },
                        leading: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Settings",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          print("Logout");
                          setState(() {
                            appbar = Center(
                              child: Text("Logout"),
                            );
                          });
                        },
                        leading: Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Logout",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 200),
              builder: (_, double val, __) {
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 6) * val),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(value == 1 ? 10 : 0),
                    child: Scaffold(
                      appBar: AppBar(
                        title: appbar,
                      ),
                      body: Center(
                        child: Text("Swipe right to open menu"),
                      ),
                    ),
                  ),
                ));
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          )
        ],
      ),
    );
  }
}
