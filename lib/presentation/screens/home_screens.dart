import 'package:alif_app/presentation/blocs/item_bloc.dart';
import 'package:alif_app/presentation/screens/itesm_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<ItemBloc>().loadItems();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<ItemBloc>().loadItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alif App')),
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is ItemLoading && state.items.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ItemError) {
            return Center(child: Text("state.error"));
          }
          if (state is ItemLoaded) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return Container(
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: item.imageUrl,
                        // width: 50,
                        height: 400,
                        placeholder: (context, url) => SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      ListTile(
                        // leading: CachedNetworkImage(
                        //   imageUrl: item.imageUrl,
                        //   width: 50,
                        //   height: 50,
                        //   placeholder: (context, url) =>
                        //       CircularProgressIndicator(),
                        //   errorWidget: (context, url, error) =>
                        //       Icon(Icons.error),
                        // ),
                        title: Text(item.name),
                        subtitle: Text('${item.city}, ${item.state}'),
                        trailing: Text(item.endDate),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ItemDetailPage(
                                      detailUrl: item.detailUrl)));
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return Container(
            child: Text("data"),
          );
        },
      ),
    );
  }
}
