import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String image;
  final String tag;
  const ImageView({Key key, this.image, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: tag,
                    child: Image.network(
                      image,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                  ),
                  child: IconButton(
                    onPressed: () => {print("Clicked"), Navigator.pop(context)},
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
