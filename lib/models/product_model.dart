class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: (jsonData['price'] is int)
          ? (jsonData['price'] as int).toDouble()
          : jsonData['price']?.toDouble() ?? 0.0,
      description: jsonData['description'] ?? '',
      category: jsonData['category'] ?? '',
      image: jsonData['image'] ?? '',
      rating: RatingModel.fromJson(
        jsonData['rating'] ?? {'rate': 0.0, 'count': 0},
      ),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] is int)
          ? (jsonData['rate'] as int).toDouble()
          : jsonData['rate']?.toDouble() ?? 0.0,
      count: jsonData['count'] ?? 0,
    );
  }
}
