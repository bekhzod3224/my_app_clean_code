part of 'item_bloc.dart';

abstract class ItemState {
  final List<ItemEntity> items;

  const ItemState({this.items = const []});
}

class ItemInitial extends ItemState {}

class ItemLoading extends ItemState {
  const ItemLoading({super.items});
}

class ItemLoaded extends ItemState {
  const ItemLoaded(List<ItemEntity> items) : super(items: items);
}

class ItemError extends ItemState {
  final String error;

  const ItemError({required this.error, List<ItemEntity> items = const []})
      : super(items: items);
}
