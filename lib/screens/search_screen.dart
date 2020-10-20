import 'package:flutter/material.dart';

import 'search_results.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearching = false;
  String searchQuery;
  TextEditingController dataController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.8,
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Builder(
              builder: (context) => TextField(
                  controller: dataController,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  onSubmitted: (data) {
                    print(dataController.text);
                    // print(searchQuery);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => SearchResult(
                              searchQuery: data,
                            )));
                  })),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // print(searchQuery);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => SearchResult(
                        searchQuery: dataController.text,
                      )));
            },
          )
        ],
      ),
    );
  }
}
