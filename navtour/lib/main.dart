import 'package:flutter/material.dart';
import 'package:navtour/HomePage/MapPage/Explorar.dart';
import 'package:navtour/HomePage/homePage.dart';
import 'LoginPage/login.dart';
import 'registerPage/register.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
      '/Explorar': (context) => HomePage(), // Rota para a página "filtros"
    },
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}
