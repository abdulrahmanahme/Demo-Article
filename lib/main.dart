import 'package:artical_tast/service_locator%20.dart';
import 'package:artical_tast/view/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  ServiceLocator.setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
