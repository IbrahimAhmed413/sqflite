import 'package:flutter/material.dart';
import 'package:sqflite/home_screen.dart';

class CatagoriesScreen extends StatefulWidget {
  const CatagoriesScreen({super.key});

  @override
  State<CatagoriesScreen> createState() => _CatagoriesScreenState();
}

class _CatagoriesScreenState extends State<CatagoriesScreen> {
  var _catagoryNameController = TextEditingController();
  var _catagoryDescriptionController = TextEditingController();
  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    print("Catagory ${_catagoryNameController.text}");
                    print("Description ${_catagoryDescriptionController.text}");
                  },
                  child: Text("Save")),
            ],
            title: Text("catagories form"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _catagoryNameController,
                    decoration: InputDecoration(
                        hintText: "Write a Catagory", labelText: "Catagory"),
                  ),
                  TextField(
                    controller: _catagoryDescriptionController,
                    decoration: InputDecoration(
                        hintText: "Write a Description",
                        labelText: "Description"),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: BackButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ))),
        title: Text(
          "Catagories",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(child: Text("Welcome to catagories Screen")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
