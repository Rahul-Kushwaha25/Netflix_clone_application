import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/library_screen.dart';
import 'package:netflix_clone/screens/search_screen.dart';

import '../screens/home_screen.dart';

class bottomNavBar extends StatefulWidget {
  const bottomNavBar({super.key});

  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.search), text: "Search"),
              Tab(icon: Icon(Icons.library_add_outlined), text: "Library"),
            ],
            indicatorColor: Colors.red,
            labelColor: Colors.red,
          ),
        ),
        body: TabBarView(children: [
          home_screen(),
          search_screen(),
          library_screen(),
        ]),
      )
      
      ,
    

    );
  }
}
