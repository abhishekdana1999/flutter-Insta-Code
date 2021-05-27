import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getHeader(),
                Container(
                  padding: EdgeInsets.only(top: 20, left: 14),
                  child: Text(
                    "Discover",
                    style: GoogleFonts.montserrat(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[900]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 25, left: 14),
                  child: _getTopNavgation(),
                ),
                Container(
                  padding: EdgeInsets.only(top: 25, left: 0),
                  child: _getSliders(),
                ),
                Container(
                  padding: EdgeInsets.only(top: 25, left: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Explore More",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      FlatButton(
                        onPressed: () {},
                        color: Colors.transparent,
                        child: Text("See All",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.grey)),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 25, left: 0),
                  child: _getExplore(),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.grey[400],
          iconSize: 20,
          items: [
            BottomNavigationBarItem(
                title: Text(''),
                icon: Icon(
                  Icons.grid_view,
                  color: Colors.black,
                )),
            BottomNavigationBarItem(
                title: Text(''), icon: Icon(Icons.stacked_bar_chart)),
            BottomNavigationBarItem(title: Text(''), icon: Icon(Icons.refresh)),
            BottomNavigationBarItem(title: Text(''), icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }

  _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://instagram.fdel42-1.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/p750x750/184815868_821089655457980_4550012645200189163_n.jpg?tp=1&_nc_ht=instagram.fdel42-1.fna.fbcdn.net&_nc_cat=108&_nc_ohc=hgwFmwSY8PUAX-1JRHj&edm=AP_V10EBAAAA&ccb=7-4&oh=c521daa94059f5515492e4c7ca7f562b&oe=60B695F0&_nc_sid=4f375e',
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }

  _getTopNavgation() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Places",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Inspiration",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Emotions",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }

  _getSliders() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
            3,
            (index) => Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 250,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/" +
                                  (index + 1).toString() +
                                  '.jpg',
                            ),
                            fit: BoxFit.cover,
                          )),
                      padding: EdgeInsets.all(10),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 250,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              stops: [0.0, 1.0],
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              tileMode: TileMode.repeated,
                              colors: [
                                Colors.black.withOpacity(0),
                                Colors.black.withOpacity(0.5)
                              ])),
                      padding: EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, left: 8.0),
                              child: Text(
                                "Cascade",
                                style:
                                    GoogleFonts.montserrat(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Canada,Banif",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
      ),
    );
  }

  _getExplore() {
    List colors = [
      Colors.red[100],
      Colors.green[100],
      Colors.yellow[100],
      Colors.indigo[100],
      Colors.deepOrange[100]
    ];
    List icons = [
      Icons.ac_unit,
      Icons.accessibility_new,
      Icons.account_balance_outlined,
      Icons.account_tree_outlined,
      Icons.add_a_photo_outlined
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            5,
            (index) => Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colors[index],
                        ),
                        child: Icon(icons[index]),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
