import 'package:animal_feeder_game/constants/theme.dart';
import 'package:animal_feeder_game/screens/main_dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.themeData,
      home: const MainDashboard(),
    );
  }
}

