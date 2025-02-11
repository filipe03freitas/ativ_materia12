import '../database/database_helper.dart';
import '../models/planet.dart';

class PlanetService {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<Planet>> fetchPlanets() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> planetMaps = await db.query('planets');
    return planetMaps.map((map) => Planet.fromMap(map)).toList();
  }

  Future<void> addPlanet(Planet planet) async {
    final db = await _dbHelper.database;
    await db.insert('planets', planet.toMap());
  }

  Future<void> updatePlanet(Planet planet) async {
    final db = await _dbHelper.database;
    await db.update('planets', planet.toMap(), where: 'id = ?', whereArgs: [planet.id]);
  }

  Future<void> deletePlanet(int id) async {
    final db = await _dbHelper.database;
    await db.delete('planets', where: 'id = ?', whereArgs: [id]);
  }
}
