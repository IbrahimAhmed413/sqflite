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
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  readData(table) async {
    var connection = await database;
    return await connection.query(table);
  }
}
