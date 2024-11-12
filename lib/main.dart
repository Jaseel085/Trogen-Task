import 'package:flutter/material.dart';
import 'package:trogen/feature/home_screen.dart';
var wi;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    wi=MediaQuery.of(context).size.width;
    return const MaterialApp(
   debugShowCheckedModeBanner: false,

      home: HomeScreen(),
    );
  }
}
