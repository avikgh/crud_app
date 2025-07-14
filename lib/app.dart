import 'package:crud_app/ui/screens/product_list_screen.dart';
import 'package:crud_app/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud App',
      debugShowCheckedModeBanner: false,
      theme: _buildLightTheme(),
      home: SplashScreen(),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF8986C4)
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF8986C4),
        foregroundColor: Colors.white
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: Colors.white
        )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF8986C4),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          )
        )
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFF8986C4))
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF8986C4))
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF8986C4))
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF8986C4), width: 2)
        ),
        labelStyle: TextStyle(
          color: Color(0xFF6C67C6),
          fontWeight: FontWeight.w500
        )
      )
    );
  }
}
