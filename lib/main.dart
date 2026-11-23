import 'package:flutter/material.dart';
import 'pages/katalog_page.dart';

void main() {
  runApp(const KedaiKopiApp());
}

class KedaiKopiApp extends StatelessWidget {
  const KedaiKopiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Kedai Kopi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFBF8F4),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4E342E),
          surface: const Color(0xFFFBF8F4),
        ),
        fontFamily: 'Roboto',
      ),
      home: const KatalogPage(),
    );
  }
}