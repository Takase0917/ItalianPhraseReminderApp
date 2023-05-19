import 'package:flutter/material.dart';
import 'package:italianphrasereminder/models/favorites_model.dart';
import 'package:provider/provider.dart';

class PhraseCard extends StatelessWidget {
  const PhraseCard({
    Key? key,
    required this.phrase,
  }) : super(key: key);

  final Map<String, String> phrase;

  @override
  Widget build(BuildContext context) {
    var favoritesModel = Provider.of<FavoritesModel>(context);

    return Card(
      child: Column(
        children: [
          Text(
            phrase['italian']!,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            phrase['english']!,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          IconButton(
            icon: Icon(
              favoritesModel.contains(phrase)
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
            color: Colors.red,
            onPressed: () {
              if (favoritesModel.contains(phrase)) {
                favoritesModel.remove(phrase);
              } else {
                favoritesModel.add(phrase);
              }
            },
          ),
        ],
      ),
    );
  }
}
