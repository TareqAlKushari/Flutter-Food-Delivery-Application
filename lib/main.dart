import 'package:flutter/material.dart';

import 'constants.dart';
import 'home.dart';

void main() {
  runApp(const Foodly());
}

class Foodly extends StatefulWidget {

  const Foodly({super.key});

  @override
  State<Foodly> createState() => _FoodlyState();
}

class _FoodlyState extends State<Foodly> {
  // TODO: Setup default theme
  ThemeMode themeMode = ThemeMode.light;
 // Manual theme toggle
  ColorSelection colorSelected = ColorSelection.pink;

  // TODO: Add changeTheme above here
  void changeThemeMode(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  void changeColor(int value) {
    setState(() {
      colorSelected = ColorSelection.values[value];
    });
  }
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Foodly';
    // TODO: Setup default theme
    //3
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false, // Uncomment to remove Debug banner
      // TODO: Add theme
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      // TODO: Replace Scaffold with Home widget
      // 4
      home: Home(
        appTitle: appTitle, //todo: stef delete this?

        changeTheme: changeThemeMode,
        changeColor: changeColor,
        colorSelected: colorSelected,
      ),
    );
  }
}