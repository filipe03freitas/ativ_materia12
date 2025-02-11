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
      onCreate: (db, version) async {
        await _onCreate(db, version);
        await insertDefaultPlanets(db); // Insere os planetas automaticamente
      },
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

  Future<void> insertDefaultPlanets(Database db) async {
    List<Map<String, dynamic>> planets = await db.query('planets');
    if (planets.isEmpty) {
      List<Map<String, dynamic>> solarSystemPlanets = [
        {'name': 'Mercúrio', 'distance': 0.39, 'size': 4879, 'nickname': 'O Mensageiro dos Deuses'},
        {'name': 'Vênus', 'distance': 0.72, 'size': 12104, 'nickname': 'Estrela D’Alva'},
        {'name': 'Terra', 'distance': 1.00, 'size': 12742, 'nickname': 'Planeta Azul'},
        {'name': 'Marte', 'distance': 1.52, 'size': 6779, 'nickname': 'Planeta Vermelho'},
        {'name': 'Júpiter', 'distance': 5.20, 'size': 139820, 'nickname': 'Gigante Gasoso'},
        {'name': 'Saturno', 'distance': 9.58, 'size': 116460, 'nickname': 'Senhor dos Anéis'},
        {'name': 'Urano', 'distance': 19.22, 'size': 50724, 'nickname': 'Gigante Gelado'},
        {'name': 'Netuno', 'distance': 30.05, 'size': 49244, 'nickname': 'O Azul Profundo'}
      ];

      for (var planet in solarSystemPlanets) {
        await db.insert('planets', planet);
      }
    }
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