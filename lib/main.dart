import 'package:flutter/material.dart';
import 'package:nicolas_flutter_final_assignment/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          displayMedium: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
          displaySmall: TextStyle(
            color: Colors.white,
            fontSize: 13.0,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
