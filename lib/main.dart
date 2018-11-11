import 'package:flutter/material.dart';
// 1. importando la clase splash_screem.dart
import 'package:login_app/splash_screem.dart';

void main(){
  runApp(
    MaterialApp(
      title: 'Login Page',
      // 2. En home se instancia el contenido de
      // splash_screem.dart(se mostrara como
      // pantalla inicial por 2 segundos)
      home: SplashScreem(),
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.red[600]
      ),
    )
  );
}