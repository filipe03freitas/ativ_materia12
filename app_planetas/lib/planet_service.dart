/*class Planet {
  final int? id;
  final String name;
  final double distance;
  final double size;
  final String? nickname;

  Planet({this.id, required this.name, required this.distance, required this.size, this.nickname});

  // Converte um Mapa do banco de dados para um objeto Planet
  factory Planet.fromMap(Map<String, dynamic> map) {
    return Planet(
      id: map['id'],
      name: map['name'],
      distance: map['distance'].toDouble(), // Garante que é double
      size: map['size'].toDouble(), // Garante que é double
      nickname: map['nickname'],
    );
  }

  // Converte um objeto Planet para um Mapa para salvar no banco
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'distance': distance,
      'size': size,
      'nickname': nickname,
    };
  }
}
*/