import 'package:Day_1/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderScreen extends StatefulWidget {
  SliderScreen({Key key}) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  PageController _controller;
  List items = [
    {
      "image": "assets/images/1.jpg",
      "title": "Trips",
      "heading": "Mountains",
      "description":
          "We need to use Align class to align widgets at the bottom, Align class has a property named alignment."
    },
    {
      "image": "assets/images/2.jpg",
      "title": "Trips",
      "heading": "Mountains",
      "description":
          "We need to use Align class to align widgets at the bottom, Align class has a property named alignment."
    },
    {
      "image": "assets/images/3.jpg",
      "title": "Trips",
      "heading": "Mountains",
      "description":
          "We need to use Align class to align widgets at the bottom, Align class has a property named alignment."
    }
  ];

  @override
  void initState() {
    super.initState();

    _controller = new PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      items[index]['image'],
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.3,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 80, right: 16, left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(items[index]['title'],
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500, fontSize: 30)),
                            SizedBox(
                              height: 2,
                            ),
                            Text(items[index]['heading'],
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 25,
                                    color: Colors.grey[800])),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: Text(items[index]['description'],
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 18,
                                      color: Colors.grey[500])),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            RaisedButton(
                              color: Colors.indigo,
                              textColor: Colors.white,
                              onPressed: () {
                                if (_controller.page == 2) {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return HomeScreen();
                                    },
                                  ));
                                } else {
                                  int nextPage = _controller.page.round() + 1;

                                  if (nextPage == items.length) {
                                    nextPage = 0;
                                  }

                                  _controller.animateToPage(nextPage,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "NEXT",
                                style: GoogleFonts.montserrat(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.only(top: 80, right: 16, left: 16),
              child: Positioned(
                right: 0,
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: items.length,
                  axisDirection: Axis.vertical,
                  effect: ExpandingDotsEffect(
                      spacing: 8.0,
                      radius: 4.0,
                      dotWidth: 10.0,
                      dotHeight: 5.0,
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 1,
                      dotColor: Colors.grey[300],
                      activeDotColor: Colors.indigo),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
