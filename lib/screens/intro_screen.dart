import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/widget/bottomNavBar.dart';

class intro_screen extends StatefulWidget {
  const intro_screen({super.key});

  @override
  State<intro_screen> createState() => _intro_screenState();
}

class _intro_screenState extends State<intro_screen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => bottomNavBar(),)
      );
    });

    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Lottie.asset('assets/netflix.json')));
  }
}
