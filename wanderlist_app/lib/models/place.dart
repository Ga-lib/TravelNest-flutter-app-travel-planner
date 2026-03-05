class Place {
  final String id;
  final String name;
  final String description;
  final String address;
  final String hours;
  final String phone;
  final String imageUrl;
  final bool isSaved;

  Place({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.hours,
    required this.phone,
    required this.imageUrl,
    this.isSaved = false,
  });

  Place copyWith({
    String? id,
    String? name,
    String? description,
    String? address,
    String? hours,
    String? phone,
    String? imageUrl,
    bool? isSaved,
  }) {
    return Place(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
      hours: hours ?? this.hours,
      phone: phone ?? this.phone,
      imageUrl: imageUrl ?? this.imageUrl,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
