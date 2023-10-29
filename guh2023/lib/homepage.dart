import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("GUH 2023"),
          ),
          body: Column(
            children: [
              TabBar(tabs: [
                Tab(icon: Icon(Icons.home, color: Colors.deepPurple)),
                Tab(icon: Icon(Icons.local_movies, color: Colors.deepPurple)),
                Tab(icon: Icon(Icons.videogame_asset, color: Colors.deepPurple))
              ]),
              Expanded(
                  child: TabBarView(children: [
                Container(
                  child: Center(
                    child: Text('1st Tab'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('2nd Tab'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('3rd Tab'),
                  ),
                ),
              ]))
            ],
          )),
    );
  }
}
