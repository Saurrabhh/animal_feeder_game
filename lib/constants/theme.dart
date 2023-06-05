import 'package:animal_feeder_game/constants/colors.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static const _textTheme = TextTheme(
    bodyMedium: TextStyle(
        color: Color.fromARGB(255, 250, 250, 250),
        fontSize: 25,
        fontWeight: FontWeight.w400),
    titleMedium: TextStyle(
        color: Color.fromARGB(255, 60, 60, 60),
        fontSize: 24,
        fontWeight: FontWeight.w400),
    bodyLarge: TextStyle(
        color: kPrimaryColor,
        fontSize: 48,
        fontWeight: FontWeight.w400),
  );

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor));

  static final _iconButtonTheme = IconButtonThemeData(
      style: IconButton.styleFrom(backgroundColor: kPrimaryColor));

  static const _appBarTheme =
      AppBarTheme(elevation: 0, backgroundColor: Colors.transparent);

  static final themeData = ThemeData(
    elevatedButtonTheme: _elevatedButtonTheme,
    appBarTheme: _appBarTheme,
    iconButtonTheme: _iconButtonTheme,
    textTheme: _textTheme,
    scaffoldBackgroundColor: kBackgroundColor,
    useMaterial3: true,
  );
}
