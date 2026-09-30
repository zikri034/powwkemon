class Pokemon {
  final int id;
  final String types;
  final String name;
  final int height;        // dalam Rupiah
  final int weight;
  final String image;
  final String ability;
  final String description;     // path asset, mis. 'assets/images/car_1.jpg'

  const Pokemon({
    required this.id,
    required this.types,
    required this.name,
    required this.height,
    required this.weight,
    required this.image,
    required this.ability,
    required this.description,
  });

  /// Judul gabungan "Brand Nama", dipakai di list dan AppBar detail.
  String get title => '$types $name';
}
