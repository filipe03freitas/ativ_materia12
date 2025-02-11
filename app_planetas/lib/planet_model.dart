/*import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'planets.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE planets (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        distance REAL NOT NULL,
        size REAL NOT NULL,
        nickname TEXT
      )
    ''');
  }

  Future<int> insertPlanet(Map<String, dynamic> planet) async {
    final db = await database;
    return await db.insert('planets', planet);
  }

  Future<List<Map<String, dynamic>>> getPlanets() async {
    final db = await database;
    return await db.query('planets');
  }

  Future<int> updatePlanet(int id, Map<String, dynamic> planet) async {
    final db = await database;
    return await db.update('planets', planet, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deletePlanet(int id) async {
    final db = await database;
    return await db.delete('planets', where: 'id = ?', whereArgs: [id]);
  }
}
*/