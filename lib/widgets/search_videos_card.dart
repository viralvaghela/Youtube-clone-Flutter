import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:youtube/screens/video_playing.dart';

class SearchVideoCard extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String channelName;
  final String viewCount;
  final String uploadTime;
  final String videoId;
  final String description;

  const SearchVideoCard(
      {Key key,
      this.thumbnail,
      this.title,
      this.channelName,
      this.uploadTime,
      this.videoId,
      this.description,
      this.viewCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VideoPlaying(
              videoId: videoId,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.network(
                  "$thumbnail",
                  fit: BoxFit.cover,
                ),
                ListTile(
                  title: Text(
                    "$title",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Text("$channelName"),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text("$uploadTime"),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text("$description"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
