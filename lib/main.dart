import 'package:Day_1/imageView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List item = [
    {
      "image":
          "https://i.pinimg.com/736x/28/f6/fe/28f6fef2c1ccd6399fc96896e8d9a120.jpg",
    },
    {
      "image":
          "https://i.pinimg.com/originals/20/e6/5c/20e65c899bb74d671ae8502a6b9d297d.png",
    },
    {
      "image":
          "https://i.pinimg.com/originals/1f/3d/fb/1f3dfb532ca536919d6bab1d299ca045.gif",
    },
    {
      "image":
          "https://i.pinimg.com/originals/eb/84/70/eb8470563080d85cce8dec5e5cf75c7a.jpg",
    },
    {
      "image":
          "https://i.pinimg.com/originals/44/99/86/4499860452951e7c00b37a87ca63e7cd.png",
    },
    {
      "image":
          "https://i.pinimg.com/originals/44/99/86/4499860452951e7c00b37a87ca63e7cd.png",
    },
    {
      "image":
          "https://i.pinimg.com/originals/8e/58/13/8e5813afe903d02511f6cab6cc9344e8.jpg",
    },
    {
      "image":
          "https://i.pinimg.com/736x/7d/f1/d3/7df1d3f989b8a87d1fbbf33075343a84.jpg",
    },
    {
      "image":
          "https://i.pinimg.com/736x/ef/58/7f/ef587faa5952833ea19951fbc4e395ca.jpg",
    },
    {
      "image":
          "https://i.pinimg.com/736x/2d/8f/1a/2d8f1ac41223c146518afcf924b49a7c.jpg",
    },
    {
      "image":
          "https://i.pinimg.com/originals/ea/b2/68/eab268fd095ed1d66e04c249d4f84d87.jpg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Colors.black),
            padding: EdgeInsets.only(top: 36, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Creative Memories",
                    style:
                        GoogleFonts.nunito(fontSize: 56, color: Colors.white)),
                Expanded(
                  child: new StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: item.length,
                    itemBuilder: (BuildContext context, int index) => new Card(
                      color: const Color(0x00000000),
                      elevation: 10,
                      child: new GestureDetector(
                        onTap: () {
                          print("hello");
                        },
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ImageView(
                                      image: item[index]["image"],
                                      tag: "Image" + index.toString())),
                            )
                          },
                          child: Hero(
                            tag: "Image" + index.toString(),
                            child: new Container(
                              decoration: new BoxDecoration(
                                image: new DecorationImage(
                                  image: new NetworkImage(item[index]["image"]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: new BorderRadius.all(
                                    const Radius.circular(10.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(2, index.isEven ? 3 : 4),
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
