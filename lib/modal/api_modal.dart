class ApiModal {
  late int id;
  late dynamic price;
  late String title, description, category, image;
  late Rating rating;

  ApiModal(
      {required this.id,
      required this.price,
      required this.title,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});
  factory ApiModal.fromJson(Map m1)
  {
    return ApiModal(id: m1['id'], price: m1['price'], title: m1['title'], description: m1['description'], category: m1['category'], image: m1['image'], rating: Rating.fromJson(m1['rating']));
  }
}

class Rating {
  late dynamic rate;
  late int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map m1) {
    return Rating(rate: m1['rate'], count: m1['count']);
  }
}
