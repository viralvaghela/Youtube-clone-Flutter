import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube/models/Post.dart';
import 'package:youtube/widgets/search_videos_card.dart';
import 'package:youtube/widgets/videoCard.dart';

class SearchResult extends StatefulWidget {
  final String searchQuery;

  SearchResult({this.searchQuery});

  @override
  _SearchResultState createState() => _SearchResultState(searchQuery);
}

class _SearchResultState extends State<SearchResult> {
  final String searchQuery;
  bool isLoading = true;
  Post post;

  _SearchResultState(this.searchQuery);

  @override
  void initState() {
    super.initState();
    searchVideos();
  }

  void searchVideos() async {
    var res = await http.get(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=$searchQuery&type=video&key=YOURKEY");
    var jsonData = jsonDecode(res.body);
    post = Post.fromJson(jsonData);

    print(post.items.length);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$searchQuery"),
        elevation: 0,
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: post.items.length,
              itemBuilder: (context, index) => SearchVideoCard(
                channelName: "${post.items[index].snippet.channelTitle}",
                thumbnail: "${post.items[index].snippet.thumbnails.high.url}",
                title: "${post.items[index].snippet.title}",
                uploadTime: "${post.items[index].snippet.publishTime}",
                description: "${post.items[index].snippet.description}",
                videoId: "${post.items[index].id.videoId}",
              ),
            ),
    );
  }
}
