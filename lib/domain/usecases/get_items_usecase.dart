import '../repositories/item_repository.dart';
import '../entities/item_entity.dart';
import '../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetItemsUseCase {
  final ItemRepository repository;

  GetItemsUseCase(this.repository);

  Future<Either<Failure, List<ItemEntity>>> call(int page, int limit) async {
    try {
      final items = await repository.getItems(page, limit);
      return Right(items);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch items: ${e.toString()}'));
    }
  }
}
