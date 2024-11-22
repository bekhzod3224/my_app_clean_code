import 'package:alif_app/data/datasources/local_data_source.dart';
import 'package:alif_app/data/datasources/remote_data_source.dart';
import 'package:alif_app/data/repositories/item_repository_impl.dart';
import 'package:alif_app/domain/repositories/item_repository.dart';
import 'package:alif_app/domain/usecases/get_items_usecase.dart';
import 'package:alif_app/presentation/blocs/item_bloc.dart';
import 'package:alif_app/presentation/screens/home_screens.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация зависимостей
  final dio = Dio();
  final localDataSource = ItemLocalDataSource();
  await localDataSource.initDatabase();

  final remoteDataSource = ItemRemoteDataSource();
  final ItemRepository repository = ItemRepositoryImpl(
      remoteDataSource: remoteDataSource, localDataSource: localDataSource);
  final getItemsUseCase = GetItemsUseCase(repository);
  runApp(MyApp(getItemsUseCase: getItemsUseCase));
}

class MyApp extends StatelessWidget {
  final GetItemsUseCase getItemsUseCase;

  const MyApp({Key? key, required this.getItemsUseCase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ItemBloc(getItemsUseCase: getItemsUseCase),
        child: HomePage(),
      ),
    );
  }
}
