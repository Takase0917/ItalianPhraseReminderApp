import 'package:flutter/material.dart';
import 'package:italianphrasereminder/widgets/phrase_card.dart';
import 'package:italianphrasereminder/models/favorites_model.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favoritesModel = Provider.of<FavoritesModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoritesModel.favorites.length,
        itemBuilder: (BuildContext context, int index) {
          var phrase = favoritesModel.favorites[index];
          return PhraseCard(phrase: phrase);
        },
      ),
    );
  }
}
