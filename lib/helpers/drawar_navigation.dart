import 'package:flutter/material.dart';

class DrawarNavigation extends StatefulWidget {
  @override
  State<DrawarNavigation> createState() => _DrawarNavigationState();
}

class _DrawarNavigationState extends State<DrawarNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(''),
              ),
              accountName: Text("Ibrahim"),
              accountEmail: Text("ibrahimahmed12333@gmail.com"),
              decoration: BoxDecoration(color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
