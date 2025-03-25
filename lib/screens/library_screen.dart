import 'package:flutter/material.dart';

class library_screen extends StatefulWidget {
  const library_screen({super.key});

  @override
  State<library_screen> createState() => _library_screenState();
}

class _library_screenState extends State<library_screen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Empty (´•︵•`) ",
        style: TextStyle(
          fontSize: 30,
          color: Colors.grey
        ),
        ),
      ),
    );
  }
}