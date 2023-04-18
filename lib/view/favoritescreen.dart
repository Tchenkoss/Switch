import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/view/wishlist.dart';

import '../provider/favorite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WishList()));
            },
            icon: const Icon(Icons.favorite),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Consumer<FavouriteProvider>(
                builder: (context, value, child) {
              return ListTile(
                onTap: () {
                  value.addItem(index);
                },
                title: Text('Item $index'),
                trailing: value.selectedItem.contains(index)
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
                iconColor: Colors.red,
              );
            });
          }),
    );
  }
}
