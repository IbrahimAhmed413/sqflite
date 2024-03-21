import 'package:flutter/material.dart';
import 'package:todoapp/home_screen.dart';
import 'package:todoapp/services/catagory_service.dart';

import 'models/catagory.dart'; // Adjust the path as per your project structure

class CatagoriesScreen extends StatefulWidget {
  const CatagoriesScreen({super.key});

  @override
  State<CatagoriesScreen> createState() => _CatagoriesScreenState();
}

class _CatagoriesScreenState extends State<CatagoriesScreen> {
  var _catagoryNameController = TextEditingController();
  var _catagoryDescriptionController = TextEditingController();

  var _category = Catagory();
  var _categoryService = CategoryService();

  List<Catagory>? _categoryList;

  void initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    var categories = await _categoryService.readCategories();
    setState(() {
      _categoryList!.clear(); // Clear the existing list before adding new items
      categories.forEach((category) {
        var categoryModel =
            Catagory(); // Create a new instance for each category
        categoryModel.id = category['id'];
        categoryModel.name = category['name'];
        categoryModel.description = category['description'];
        _categoryList!.add(categoryModel); // Add the category to the list
      });
    });
  }

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
                  onPressed: () async {
                    _category.name = _catagoryNameController.text;
                    _category.description = _catagoryDescriptionController.text;
                    var result = await _categoryService.saveCategory(_category);
                    print(result);
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
      body: ListView.builder(
          // itemCount: _categoryList.length,
          itemBuilder: (context, index) {
        return Card(
            // child
            );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
