import 'package:flutter/material.dart';
import '../models/planet.dart';
import '../services/planet_service.dart';
import 'planet_form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PlanetService _planetService = PlanetService();
  late Future<List<Planet>> planetsFuture;

  @override
  void initState() {
    super.initState();
    _loadPlanets();
  }

  void _loadPlanets() {
    setState(() {
      planetsFuture = _planetService.fetchPlanets();
    });
  }

  void _deletePlanet(int id) async {
    await _planetService.deletePlanet(id);
    _loadPlanets();
  }

  void _navigateToForm({Planet? planet}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlanetFormPage(planet: planet),
      ),
    );
    if (result == true) {
      _loadPlanets();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Planetas')),
      body: FutureBuilder<List<Planet>>(
        future: planetsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum planeta cadastrado.'));
          }

          final planets = snapshot.data!;
          return ListView.builder(
            itemCount: planets.length,
            itemBuilder: (context, index) {
              final planet = planets[index];
              return ListTile(
                title: Text(planet.name),
                subtitle: Text(planet.nickname ?? 'Sem apelido'),
                onTap: () => _navigateToForm(planet: planet),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deletePlanet(planet.id!),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
