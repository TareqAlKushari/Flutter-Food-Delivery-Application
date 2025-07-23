import 'package:flutter/material.dart';
import 'package:foodly/screens/explore_page.dart';

import 'components/category_card.dart';
import 'components/color_button.dart';
import 'components/post_card.dart';
import 'components/restaurant_landscape_card.dart';
import 'components/theme_button.dart';
import 'constants.dart';
import 'models/food_category.dart';
import 'models/post.dart';
import 'models/restaurant.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected,
    required this.appTitle,
  });

  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;
  final String appTitle;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TODO: Track current tab
  int tab = 0;

  // TODO: Define tab bar destinations
  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      label: 'Explore',
      selectedIcon: Icon(Icons.home),
    ),
    NavigationDestination(
      icon: Icon(Icons.list_outlined),
      label: 'Orders',
      selectedIcon: Icon(Icons.list),
    ),
    NavigationDestination(
      icon: Icon(Icons.person_2_outlined),
      label: 'Account',
      selectedIcon: Icon(Icons.person),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: Define pages
    final pages = [
      ExplorePage(),
      const Center(
          child: Text('Order Page', style: TextStyle(fontSize: 32.0)),
      ),
      const Center(
        child: Text('Account Page', style: TextStyle(fontSize: 32.0)),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
        elevation: 4.0,
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          ThemeButton(
            changeThemeMode: widget.changeTheme,
          ),
          ColorButton(
            changeColor: widget.changeColor,
            colorSelected: widget.colorSelected,
          ),
        ],
      ),
      // TODO: Switch between pages
      body: IndexedStack(index: tab, children: pages),
      // TODO: Add bottom navigation bar
      // 1
      bottomNavigationBar: NavigationBar(
        // 2
        selectedIndex: tab,
        // 3
        onDestinationSelected: (index) {
          setState(() {
            tab = index;
          });
        },
        // 4
        destinations: appBarDestinations,
      ),
    );
  }
}