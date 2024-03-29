import 'package:sqflite/sqflite.dart';

import 'database_connection.dart';

class Repository {
  Databaseconnection? _databaseConnection;

  Repository() {
    // Corrected the constructor name
    _databaseConnection = Databaseconnection();
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _databaseConnection?.setDatabase();
    return _database!;
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
