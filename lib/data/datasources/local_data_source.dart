import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/item_model.dart';

class ItemLocalDataSource {
  late Database _database;

  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'items_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE items(name TEXT, city TEXT, state TEXT, endDate TEXT, imageUrl TEXT, detailUrl TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> saveItems(List<ItemModel> items) async {
    for (var item in items) {
      await _database.insert('items', item.toJson(), 
        conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<ItemModel>> getItems() async {
    final List<Map<String, dynamic>> maps = await _database.query('items');
    return List.generate(maps.length, (i) {
      return ItemModel.fromJson(maps[i]);
    });
  }
}