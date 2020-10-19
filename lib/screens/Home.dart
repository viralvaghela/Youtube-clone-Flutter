import 'package:flutter/material.dart';
import 'package:youtube/widgets/videoCard.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          VideoCard(),
          VideoCard(),
          VideoCard(),
          VideoCard(),
          VideoCard(),
        ],
      ),
    );
  }
}
