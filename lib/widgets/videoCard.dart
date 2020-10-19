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
          Image.network(
              "https://cdn.vox-cdn.com/thumbor/5Vn4o-4_AA-7i95-ZNeHR9bn1sI=/0x0:2040x1360/1400x933/filters:focal(857x517:1183x843):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/67108186/elon_musk_tesla_3036.0.jpg"),
          ListTile(
            title: Text(
              "Elon Musk - The Next Big Technologt",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              maxRadius: 20,
              backgroundImage: NetworkImage(
                  'https://lh3.googleusercontent.com/ogw/ADGmqu-NuxMDc19qon7BR3p1vPIUGdGjtSOy2sYoHZmV=s32-c-mo'),
            ),
            subtitle: Text("Dave Business - 59 K - 4 days ago"),
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
