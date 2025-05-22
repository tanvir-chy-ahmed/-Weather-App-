import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/home.dart';
/*
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║              🌤️ WEATHER APP - MADE WITH FLUTTER              ║
║                                                              ║
║    💻 Developed by: Tanvir Ahmed (Chy)                       ║
║    📅 Created: 21 May 2025                                   ║
║    🔗 GitHub: https://github.com/tanvir-chy-ahmed            ║
║                                                              ║
║    📱 This app shows real-time weather info with dynamic     ║
║       gradient backgrounds based on the forecast.            ║
║                                                              ║
║                                                              ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
*/

void main(){
  runApp(const MainScreen());
}


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
