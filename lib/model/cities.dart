import 'dart:convert';

List<Cities> citiesFromJson(String str) =>
    List<Cities>.from(json.decode(str).map((x) => Cities.fromJson(x)));

String citiesToJson(List<Cities> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cities {
  Cities({
    this.id,
    this.name,
    this.description,
    this.imageurl,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String description;
  String imageurl;
  DateTime createdAt;
  DateTime updatedAt;

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imageurl: json["imageurl"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "imageurl": imageurl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
