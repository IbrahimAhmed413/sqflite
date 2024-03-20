import 'package:sqflite/sqflite.dart';

import 'database_connection.dart';

class Repository {
  late Databaseconnection _databaseConnection;

  Repository() {
    // Corrected the constructor name
    _databaseConnection = Databaseconnection();
  }

  static late Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  inserData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }
}
