import 'package:todoapp/models/catagory.dart';
import 'package:todoapp/repositiories/repository.dart';

class CategoryService {
  late Repository _repository;
  CategoryService() {
    _repository = Repository();
  }

  // Specify the return type of the method
  saveCategory(Catagory category) async {
    return await _repository.insertData('categories', category.categoryMap());
  }

  readCategories() async {
    return await _repository.readData('categories');
  }
}
