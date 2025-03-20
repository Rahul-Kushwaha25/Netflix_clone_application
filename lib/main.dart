import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 24,

          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: intro_screen(),
    );
  }
}

