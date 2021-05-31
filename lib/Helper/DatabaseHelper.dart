import 'package:fluttermachinetest/Models/InstaModel.dart';
import 'package:fluttermachinetest/Models/TableModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE BookMarkUsers(id INTEGER PRIMARY KEY AUTOINCREMENT,userId  TEXT NOT NULL,channelname TEXT NOT NULL,titile TEXT NOT NULL,hthumbnail TEXT NOT NULL,mthumbnail TEXT NOT NULL,lthumbnail TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertUser(List<TableModel> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var user in users) {
      result = await db.insert('BookMarkUsers', user.toMap());
    }
    return result;
  }

 Future<List<TableModel>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('BookMarkUsers');
    return queryResult.map((e) => TableModel.fromMap(e)).toList();
  }

    Future<void> deleteUser(String id) async {
    final db = await initializeDB();
    await db.delete(
      'BookMarkUsers',
      where: "userId = ?",
      whereArgs: [id],
    );
  }



}
