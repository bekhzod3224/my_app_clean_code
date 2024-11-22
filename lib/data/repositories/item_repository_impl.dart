import 'package:alif_app/data/datasources/local_data_source.dart';
import 'package:alif_app/data/datasources/remote_data_source.dart';
import 'package:alif_app/domain/entities/item_entity.dart';
import 'package:alif_app/domain/repositories/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemRemoteDataSource remoteDataSource;
  final ItemLocalDataSource localDataSource;

  ItemRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<List<ItemEntity>> getItems(int page, int limit) async {
    try {
      // Получаем данные с удаленного источника
      final remoteItems = await remoteDataSource.getItems(page, limit);

      // Сохраняем в локальную базу данных
      await localDataSource.saveItems(remoteItems);

      // Преобразуем Model в Entity
      return remoteItems
          .map((model) => ItemEntity(
              name: model.name,
              city: model.city,
              state: model.state,
              endDate: model.endDate,
              imageUrl: model.imageUrl,
              detailUrl: model.detailUrl))
          .toList();
    } catch (e) {
      // Если нет сети, получаем из локальной базы
      final localItems = await localDataSource.getItems();
      return localItems
          .map((model) => ItemEntity(
              name: model.name,
              city: model.city,
              state: model.state,
              endDate: model.endDate,
              imageUrl: model.imageUrl,
              detailUrl: model.detailUrl))
          .toList();
    }
  }
}
