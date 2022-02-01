import 'dart:convert';

List<graph> graphFromJson(String str) =>
    List<graph>.from(json.decode(str).map((x) => graph.fromMap(x)));

class graph {
  String name;
  String title;
  String description;
  String graphImg;

  graph({this.name,this.title, this.description, this.graphImg});

  factory graph.fromMap(Map<String, dynamic> json) => graph(
        name: json["name"],
        title: json["title"],
        description: json["description"],
        graphImg: json["graphImg"],
      );
}
