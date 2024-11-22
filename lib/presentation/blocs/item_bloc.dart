import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../domain/usecases/get_items_usecase.dart';
import '../../domain/entities/item_entity.dart';
import '../../core/error/failure.dart';

part 'item_state.dart';

class ItemBloc extends Cubit<ItemState> {
  final GetItemsUseCase getItemsUseCase;
  int _currentPage = 0;
  final int _limit = 3;

  ItemBloc({required this.getItemsUseCase}) : super(ItemInitial());

  void loadItems() async {
    if (state is ItemLoading) return;

    try {
      emit(ItemLoading(items: state.items));
      final Either<Failure, List<ItemEntity>> result =
          await getItemsUseCase.call(_currentPage, _limit);

      result.fold(
          (failure) =>
              emit(ItemError(error: failure.message, items: state.items)),
          (newItems) {
        final updatedItems = List<ItemEntity>.from(state.items)
          ..addAll(newItems);
        emit(ItemLoaded(updatedItems));
        _currentPage++;
      });
    } catch (e) {
      print("object");
      emit(ItemError(error: e.toString(), items: state.items));
    }
  }
}
