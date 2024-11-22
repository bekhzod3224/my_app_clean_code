import 'package:dio/dio.dart';
import '../models/item_model.dart';

// class ItemRemoteDataSource {
//   final Dio dio;

//   ItemRemoteDataSource(this.dio);

//   Future<List<ItemModel>> getItems(int page, int limit) async {
//     try {
//       final response = await dio.get('/items', queryParameters: {
//         'page': page,
//         'limit': limit
//       });

//       List<dynamic> data = response.data;
//       return data.map((json) => ItemModel.fromJson(json)).toList();
//     } catch (e) {
//       throw Exception('Failed to load items');
//     }
//   }
// }

class ItemRemoteDataSource {
  Future<List<ItemModel>> getItems(int page, int limit) async {
   
    final mockData = [
      {
        "name": "Item 94",
        "city": "City 50",
        "state": "State 4",
        "endDate": "2024-12-21",
        "imageUrl":
            "https://images.pexels.com/photos/20881843/pexels-photo-20881843.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
        "detailUrl": "https://www.pexels.com/ru-ru/@marta-dzedyshko-1042863/"
      },
      {
        "name": "Item 12",
        "city": "City 37",
        "state": "State 21",
        "endDate": "2024-12-08",
        "imageUrl":
            "https://images.pexels.com/photos/20881842/pexels-photo-20881842.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
        "detailUrl": "https://www.pexels.com/ru-ru/@marta-dzedyshko-1042863/"
      },
      {
        "name": "Item 10",
        "city": "City 39",
        "state": "State 50",
        "endDate": "2024-12-03",
        "imageUrl": "https://example.com/608",
        "detailUrl": "https://example.com/840"
      },
      {
        "name": "Item 43",
        "city": "City 8",
        "state": "State 3",
        "endDate": "2024-12-29",
        "imageUrl": "https://example.com/181",
        "detailUrl": "https://example.com/412"
      },
      {
        "name": "Item 90",
        "city": "City 33",
        "state": "State 29",
        "endDate": "2024-12-17",
        "imageUrl": "https://example.com/960",
        "detailUrl": "https://example.com/288"
      },
      {
        "name": "Item 6",
        "city": "City 10",
        "state": "State 2",
        "endDate": "2024-12-19",
        "imageUrl": "https://example.com/579",
        "detailUrl": "https://example.com/274"
      },
      {
        "name": "Item 23",
        "city": "City 29",
        "state": "State 44",
        "endDate": "2024-12-12",
        "imageUrl": "https://example.com/512",
        "detailUrl": "https://example.com/546"
      },
      {
        "name": "Item 48",
        "city": "City 18",
        "state": "State 3",
        "endDate": "2024-12-28",
        "imageUrl": "https://example.com/767",
        "detailUrl": "https://example.com/495"
      },
      {
        "name": "Item 86",
        "city": "City 31",
        "state": "State 46",
        "endDate": "2024-12-20",
        "imageUrl": "https://example.com/206",
        "detailUrl": "https://example.com/137"
      },
      {
        "name": "Item 34",
        "city": "City 28",
        "state": "State 16",
        "endDate": "2024-12-22",
        "imageUrl": "https://example.com/351",
        "detailUrl": "https://example.com/871"
      },
      {
        "name": "Item 62",
        "city": "City 48",
        "state": "State 21",
        "endDate": "2024-12-19",
        "imageUrl": "https://example.com/464",
        "detailUrl": "https://example.com/112"
      },
      {
        "name": "Item 12",
        "city": "City 15",
        "state": "State 31",
        "endDate": "2024-12-25",
        "imageUrl": "https://example.com/887",
        "detailUrl": "https://example.com/925"
      },
      {
        "name": "Item 76",
        "city": "City 17",
        "state": "State 38",
        "endDate": "2024-12-11",
        "imageUrl": "https://example.com/374",
        "detailUrl": "https://example.com/741"
      },
      {
        "name": "Item 23",
        "city": "City 46",
        "state": "State 20",
        "endDate": "2024-12-22",
        "imageUrl": "https://example.com/174",
        "detailUrl": "https://example.com/232"
      },
      {
        "name": "Item 9",
        "city": "City 12",
        "state": "State 1",
        "endDate": "2024-12-04",
        "imageUrl": "https://example.com/503",
        "detailUrl": "https://example.com/862"
      },
      {
        "name": "Item 55",
        "city": "City 22",
        "state": "State 4",
        "endDate": "2024-12-13",
        "imageUrl": "https://example.com/299",
        "detailUrl": "https://example.com/154"
      }
    ];

    
    final startIndex = page * limit;
    final endIndex = startIndex + limit;

    final pageItems = mockData.sublist(
        startIndex, endIndex > mockData.length ? mockData.length : endIndex);

    return pageItems.map((json) => ItemModel.fromJson(json)).toList();
  }
}
