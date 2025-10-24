import 'package:flutter/material.dart';
import 'package:profitify/screens/main_screen.dart';

void main() {
  runApp(const ProfitifyApp());
}

class ProfitifyApp extends StatelessWidget {
  const ProfitifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profitify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF0D1B2A),
        scaffoldBackgroundColor: const Color(0xFF0D1B2A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF3D5A80),
          secondary: Color(0xFF98C1D9),
          background: Color(0xFF0D1B2A),
          surface: Color(0xFF1B263B),
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onBackground: Colors.white,
          onSurface: Colors.white,
          error: Color(0xFFE57373),
          onError: Colors.black,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
          titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Roboto', color: Colors.white70),
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
