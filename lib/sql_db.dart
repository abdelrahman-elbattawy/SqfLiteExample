import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final class SqlDb {
  static Database? _db;

  Future<Database?> get db async =>
      (_db == null) ? _db = await intialDB() : _db;

  Future<Database> intialDB() async {
    String databasePath = await getDatabasesPath();
    String fullPath = join(databasePath, 'notesDb.db');

    Database myDb = await openDatabase(fullPath, onCreate: onCreate);

    return myDb;
  }

  Future<void> onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "notes" (
      id INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY,
      notes TEXT NOT NULL
      )
  ''');
  }
}
