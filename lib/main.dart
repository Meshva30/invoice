import 'package:flutter/material.dart';
import 'package:invoice/addscreen.dart';
import 'package:invoice/homescreen.dart';
import 'package:invoice/pdfscreen.dart';
import 'package:invoice/splacescreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        '/': (context) => Splacescreen(),
        'home': (context) => HomeScreen(),
        'add': (context) => AddScreen(),
        'pdf': (context) => PdfScreen(),
      },
    ),
  );
}
