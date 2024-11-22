import 'package:equatable/equatable.dart';

class ItemModel extends Equatable {
  final String name;
  final String city;
  final String state;
  final String endDate;
  final String imageUrl;
  final String detailUrl;

  const ItemModel({
    required this.name,
    required this.city,
    required this.state,
    required this.endDate,
    required this.imageUrl,
    required this.detailUrl,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json['name'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      endDate: json['endDate'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      detailUrl: json['detailUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'city': city,
    'state': state,
    'endDate': endDate,
    'imageUrl': imageUrl,
    'detailUrl': detailUrl,
  };

  @override
  List<Object?> get props => [name, city, state, endDate, imageUrl, detailUrl];
}