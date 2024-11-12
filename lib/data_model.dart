class DataModel {
  String? name;
  String? id;
  String? description;
  double? price;
  String? unit;
  double? discount;
  bool? availability;
  String? brand;
  String? category;
  String? rating;
  List< dynamic>? reviews;

  DataModel({
    this.name,
    this.id,
    this.description,
    this.price,
    this.unit,
    this.discount,
    this.availability,
    this.brand,
    this.category,
    this.rating,
    this.reviews,
  });

  DataModel copyWith({
    String? name,
    String? id,
    String? description,
    double? price,
    String? unit,
    double? discount,
    bool? availability,
    String? brand,
    String? category,
    String? rating,
    List< dynamic>? reviews,
  }) {
    return DataModel(
      name: name ?? this.name,
      id: id ?? this.id,
      description: description ?? this.description,
      price: price ?? this.price,
      unit: unit ?? this.unit,
      discount: discount ?? this.discount,
      availability: availability ?? this.availability,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'description': description,
      'price': price,
      'unit': unit,
      'discount': discount,
      'availability': availability,
      'brand': brand,
      'category': category,
      'rating': rating,
      'reviews': reviews,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      name: map['name'] as String?,
      id: map['id'] as String?,
      description: map['description'] as String?,
      price: (map['price'] is int) ? (map['price'] as int).toDouble() : map['price'] as double?,
      unit: map['unit'] as String?,
      discount: (map['discount'] is int) ? (map['discount'] as int).toDouble() : map['discount'] as double?,
      availability: map['availability'] as bool?,
      brand: map['brand'] as String?,
      category: map['category'] as String?,
      rating: map['rating']?.toString(),
      reviews: map['reviews'] as List< dynamic>?,
    );
  }
}
