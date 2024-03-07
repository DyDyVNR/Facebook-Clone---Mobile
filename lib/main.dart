import 'package:assignment_1/Pages/intro-page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(    
      
      home: IntroPage(),
       theme: ThemeData.dark(),
      // darkTheme: ThemeData(colorScheme: ColorScheme.dark(onPrimary: Colors.black87)),
        themeMode: ThemeMode.light,
    );
    
  } 
} 