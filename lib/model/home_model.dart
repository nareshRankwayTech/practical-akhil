// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

List<HomeModel> homeModelFromJson(String str) =>
    List<HomeModel>.from(json.decode(str).map((x) => HomeModel.fromJson(x)));

String homeModelToJson(List<HomeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeModel {
  HomeModel({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.profile,
    required this.state,
    required this.city,
    required this.id,
  });

  DateTime createdAt;
  String name;
  String avatar;
  String firstName;
  String lastName;
  String profile;
  String state;
  String city;
  String id;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        profile: json["profile"],
        state: json["state"],
        city: json["city"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "first_name": firstName,
        "last_name": lastName,
        "profile": profile,
        "state": state,
        "city": city,
        "id": id,
      };
}
