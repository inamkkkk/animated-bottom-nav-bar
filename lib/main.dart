import 'package:animated_bottom_nav_bar/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/nav_item.dart';
import 'providers/nav_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => NavProvider(), child: MaterialApp(
      title: 'Animated Bottom Nav Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    ));
  }
}