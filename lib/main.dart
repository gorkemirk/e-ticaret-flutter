import 'package:flutter/material.dart';
import 'package:not_paylas/page_views/HomePage.dart';
import 'package:not_paylas/page_views/LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page_views/json_web_data_page.dart';
import 'page_views/sepet_page.dart';
import 'page_views/local_json_trailing.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: TextTheme(bodyMedium: GoogleFonts.lato(),)),
      home: null,
      routes:{
        "/":(context)=>HomePage(),
        "LoginPage": (context)=>LoginPage(),
        "SepetPage":(context)=>SepetSayfasi(),
        "JsonPage":(context)=>JsonPage(),
        "JsonWebPage":(context)=>JsonWebPage()
      } ,
    );
  }
}
