import 'package:todoapp/models/catagory.dart';
import 'package:todoapp/repositiories/repository.dart';

class CategoryService {
  late Repository _repository;
  CategoryService() {
    _repository = Repository();
  }

  // Specify the return type of the method
  Future<int> saveCategory(Category category) async {
    return await _repository.inserData('categories', category.categoryMap());
  }
}
