import 'package:flutter/material.dart';
import 'package:sqflite/helpers/drawar_navigation.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            "To-Do List",
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: DrawarNavigation());
  }
}
