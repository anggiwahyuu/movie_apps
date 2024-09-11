class Genres {
  int id;
  String name;

  Genres({
    required this.id,
    required this.name
  });

  factory Genres.fromJson(Map<String, dynamic> json) => Genres(
    id: json["id"], 
    name: json["name"]
  );
}