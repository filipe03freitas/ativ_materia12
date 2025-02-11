import 'package:flutter/material.dart';
import '../models/planet.dart';
import '../services/planet_service.dart';

class PlanetFormPage extends StatefulWidget {
  final Planet? planet;

  const PlanetFormPage({super.key, this.planet});

  @override
  _PlanetFormPageState createState() => _PlanetFormPageState();
}

class _PlanetFormPageState extends State<PlanetFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _distanceController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final PlanetService _planetService = PlanetService();

  @override
  void initState() {
    super.initState();
    if (widget.planet != null) {
      _nameController.text = widget.planet!.name;
      _distanceController.text = widget.planet!.distance.toString();
      _sizeController.text = widget.planet!.size.toString();
      _nicknameController.text = widget.planet!.nickname ?? '';
    }
  }

  void _savePlanet() async {
    if (_formKey.currentState!.validate()) {
      final planet = Planet(
        id: widget.planet?.id,
        name: _nameController.text,
        distance: double.tryParse(_distanceController.text) ?? 0.0,
        size: double.tryParse(_sizeController.text) ?? 0.0,
        nickname: _nicknameController.text.isNotEmpty ? _nicknameController.text : null,
      );

      if (widget.planet == null) {
        await _planetService.addPlanet(planet);
      } else {
        await _planetService.updatePlanet(planet);
      }

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.planet == null ? 'Adicionar Planeta' : 'Editar Planeta')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) => value!.isEmpty ? 'Preencha o nome' : null,
              ),
              TextFormField(
                controller: _distanceController,
                decoration: const InputDecoration(labelText: 'Distância do Sol (UA)'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Preencha a distância' : null,
              ),
              TextFormField(
                controller: _sizeController,
                decoration: const InputDecoration(labelText: 'Tamanho (km)'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Preencha o tamanho' : null,
              ),
              TextFormField(
                controller: _nicknameController,
                decoration: const InputDecoration(labelText: 'Apelido (opcional)'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _savePlanet,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
