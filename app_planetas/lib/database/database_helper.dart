import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/planet.dart';

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
    String path = join(await getDatabasesPath(), 'planets_v3.db');
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

    List<Planet> planets = [
      Planet(name: "Mercúrio", distance: 0.39, size: 4879, nickname: "O Mensageiro"),
      Planet(name: "Vênus", distance: 0.72, size: 12104, nickname: "Estrela D'Alva"),
      Planet(name: "Terra", distance: 1.0, size: 12742, nickname: "Planeta Azul"),
      Planet(name: "Marte", distance: 1.52, size: 6779, nickname: "Planeta Vermelho"),
      Planet(name: "Júpiter", distance: 5.2, size: 139820, nickname: "Gigante Gasoso"),
      Planet(name: "Saturno", distance: 9.58, size: 116460, nickname: "Senhor dos Anéis"),
      Planet(name: "Urano", distance: 19.22, size: 50724, nickname: "Gigante de Gelo"),
      Planet(name: "Netuno", distance: 30.05, size: 49244, nickname: "O Azulão"),
    ];

    for (var planet in planets) {
      await db.insert('planets', planet.toMap());
    }
  }
}
