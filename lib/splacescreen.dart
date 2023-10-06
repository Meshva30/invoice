import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invoice/homescreen.dart';

class Splacescreen extends StatefulWidget {
  const Splacescreen({super.key});

  @override
  State<Splacescreen> createState() => _SplacescreenState();
}

class _SplacescreenState extends State<Splacescreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 800,
          width: 800,
          decoration: BoxDecoration(color: Colors.black),
          child: Image.asset('assets/invoice.png'),
        ),
      ),
    );
  }
}
