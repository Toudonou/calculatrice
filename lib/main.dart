// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:calculatrice/standerdPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculatrice',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool light = true;
  List<String> listCalculs = [];
  List<String> listConvertions = [];
  @override
  Widget build(BuildContext context) {
    return StanderdPage(
      light: light,
      listCalculs: listCalculs,
      listConvertions: listConvertions,
    );
  }
}
