import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:youtube/widgets/videoCard.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var url =
      "https://raw.githubusercontent.com/viralvaghela/Youtube-clone-Flutter/master/videos.json";

  bool isLoading = true;
  List data;

  @override
  void initState() {
    super.initState();
    getVideos();
  }

  void getVideos() async {
    var response = await http.get(url);
    setState(() {
      data = jsonDecode(response.body);
      isLoading = false;
    });
    print(data.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: isLoading == true
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: data.map((item) {
                  return VideoCard(
                    thumbnail: item['thumbnail'],
                    title: item['title'],
                    channelProfilePicUrl: item['channelProfilePicUrl'],
                    channelName: item['channelName'],
                    viewCount: item['viewCount'],
                    uploadTime: item['uploadTime'],
                    videoUrl: item['videoUrl'],
                  );
                }).toList(),
              ));
  }
}
