import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  final String name;
  final String city;
  final String state;
  final String endDate;
  final String imageUrl;
  final String detailUrl;

  const ItemEntity({
    required this.name,
    required this.city,
    required this.state,
    required this.endDate,
    required this.imageUrl,
    required this.detailUrl,
  });

  @override
  List<Object?> get props => [name, city, state, endDate, imageUrl, detailUrl];
}
