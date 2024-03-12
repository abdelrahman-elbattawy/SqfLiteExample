import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final class SqlDb {
  static Database? _db;

  Future<Database?> get db async =>
      (_db == null) ? _db = await intialDB() : _db;

  intialDB() async {
    String databasePath = await getDatabasesPath();
    String fullPath = join(databasePath, 'notesDb.db');

    Database myDb =
        await openDatabase(fullPath, onCreate: _onCreate, version: 1);

    return myDb;
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();

    batch.execute('''
    CREATE TABLE "notes" (
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "title" TEXT NOT NULL,
      "note" TEXT NOT NULL
      )
  ''');

    await batch.commit();
  }

  selectData(String sql) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.rawQuery(sql);

    return response;
  }

  insertData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(sql);

    return response;
  }

  updateData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql);

    return response;
  }

  deleteData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(sql);

    return response;
  }
}
