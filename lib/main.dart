import 'package:assignment_1/Pages/intro-page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(    
      
      home: const IntroPage(),
      theme: ThemeData.dark(),
      // darkTheme: ThemeData(colorScheme: ColorScheme.dark(onPrimary: Colors.black87)),
        themeMode: ThemeMode.light,
    );
    
  } 
} 