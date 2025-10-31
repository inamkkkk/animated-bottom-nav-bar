import 'package:animated_bottom_nav_bar/models/nav_item.dart';
import 'package:animated_bottom_nav_bar/providers/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final List<NavItem> navItems = [
    NavItem(icon: Icons.home, label: 'Home'),
    NavItem(icon: Icons.search, label: 'Search'),
    NavItem(icon: Icons.favorite, label: 'Favorites'),
    NavItem(icon: Icons.settings, label: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Animated Bottom Nav Bar')),
      body: Center(child: Text('Current Tab: ${navProvider.currentIndex}')),
      bottomNavigationBar: AnimatedBottomNavBar(navItems: navItems),
    );
  }
}

class AnimatedBottomNavBar extends StatelessWidget {
  const AnimatedBottomNavBar({Key? key, required this.navItems}) : super(key: key);

  final List<NavItem> navItems;

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavProvider>(context);
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navItems.map((item) {
          int index = navItems.indexOf(item);
          bool isSelected = navProvider.currentIndex == index;
          return GestureDetector(
            onTap: () => navProvider.currentIndex = index,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    item.icon,
                    color: isSelected ? Colors.blue : Colors.grey,
                  ),
                  SizedBox(width: isSelected ? 8 : 0),
                  AnimatedSize(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: isSelected
                        ? Text(
                      item.label,
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    )
                        : SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}