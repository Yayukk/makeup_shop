import 'package:flutter/material.dart';
import 'pages/splash_page.dart'; 

void main() {
  runApp(const MakeupShopApp());
}

class MakeupShopApp extends StatelessWidget {
  const MakeupShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MakeUp Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      home: const SplashPage(), 
    );
  }
}
