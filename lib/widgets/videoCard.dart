import 'dart:ui';

import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String channelProfilePicUrl;
  final String channelName;
  final String viewCount;
  final String uploadTime;
  final String videoUrl;

  const VideoCard(
      {Key key,
      this.thumbnail,
      this.title,
      this.channelProfilePicUrl,
      this.channelName,
      this.viewCount,
      this.uploadTime,
      this.videoUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network("$thumbnail"),
          ListTile(
            title: Text(
              "$title",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              maxRadius: 20,
              backgroundImage: NetworkImage('$channelProfilePicUrl'),
            ),
            subtitle: Text("$channelName - $viewCount - $uploadTime"),
            trailing: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
