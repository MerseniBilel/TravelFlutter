import 'dart:convert';

List<Hotels> hotelsFromJson(String str) =>
    List<Hotels>.from(json.decode(str).map((x) => Hotels.fromJson(x)));

String hotelsToJson(List<Hotels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hotels {
  Hotels({
    this.id,
    this.name,
    this.description,
    this.rating,
    this.price,
    this.address,
    this.imageurl,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String description;
  int rating;
  int price;
  String address;
  String imageurl;
  int cityId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Hotels.fromJson(Map<String, dynamic> json) => Hotels(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        rating: json["rating"],
        price: json["price"],
        address: json["address"],
        imageurl: json["imageurl"],
        cityId: json["city_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "rating": rating,
        "price": price,
        "address": address,
        "imageurl": imageurl,
        "city_id": cityId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
