import 'package:flutter/material.dart';

class search_screen extends StatefulWidget {
  const search_screen({super.key});

  @override
  State<search_screen> createState() => _search_screenState();
}

class _search_screenState extends State<search_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Center(
          child: Image.asset('assets/logo.png', height: 50, width: 100,
          ),
        ),
       ),
       body: Column(
        children: [
          // search box

          //list of recent searched
        ],
       ),
    );
  }
}