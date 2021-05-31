import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _list = [
    "Mango",
    "Apple",
    "Grapes",
    "Watermelon",
    "Muskmelon",
    "Jackfruit",
    "DragonFruit",
    "Orange",
    "Kiwi",
    "Strawberry",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(16),
                height: 60,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: Colors.black12, spreadRadius: 10)
                ]),
                child: Text(
                  "Reorderable List",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ReorderableListView(
                  children: List.generate(
                      _list.length,
                      (index) => Container(
                            height: 60,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: Colors.grey.shade400),
                              ),
                            ),
                            key: Key(index.toString()),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://lh3.googleusercontent.com/-wtAFHmWhtYY/AAAAAAAAAAI/AAAAAAAAAZo/8Mqp4SN6u_c/photo.jpg?sz=120"),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(_list[index]),
                                    Text("Some sample description for testing.")
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.menu)
                              ],
                            ),
                          )),
                  onReorder: (int start, int current) {
                    // dragging from top to bottom
                    if (start < current) {
                      int end = current - 1;
                      String startItem = _list[start];
                      int i = 0;
                      int local = start;
                      do {
                        _list[local] = _list[++local];
                        i++;
                      } while (i < end - start);
                      _list[end] = startItem;
                    }
                    // dragging from bottom to top
                    else if (start > current) {
                      String startItem = _list[start];
                      for (int i = start; i > current; i--) {
                        _list[i] = _list[i - 1];
                      }
                      _list[current] = startItem;
                    }
                    setState(() {
                      AlertDialog alert = AlertDialog(
                        title: Text("New List"),
                        content: Text(_list.toString()),
                        actions: [
                          FlatButton(
                              onPressed: () => {Navigator.pop(context)},
                              child: Text("Ok"))
                        ],
                      );

                      // show the dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
