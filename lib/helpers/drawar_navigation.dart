import 'package:flutter/material.dart';
import 'package:todoapp/home_screen.dart';

import '../catagoriesScreen.dart';

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
                  // backgroundImage: AssetImage(''),
                  ),
              accountName: Text("Ibrahim Ahmed"),
              accountEmail: Text("ibrahimahmed12333@gmail.com"),
              decoration: BoxDecoration(color: Colors.deepPurple),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text("Catagories"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CatagoriesScreen(),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
