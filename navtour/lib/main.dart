import 'package:flutter/material.dart';
import 'package:navtour/HomePage/Explore/Explorar.dart';
import 'package:navtour/HomePage/homePage.dart';
import 'LoginPage/login.dart';
import 'registerPage/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
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
