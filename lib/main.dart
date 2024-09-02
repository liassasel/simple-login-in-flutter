import 'package:flutter/material.dart';
import 'package:l_prac/views/home_screen.dart';
import 'package:l_prac/views/login_views.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) =>  const LoginView(),
        '/home': (contex) => const HomePage(),
      },
    );
  }
}