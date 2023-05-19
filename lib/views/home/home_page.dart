import 'package:flutter/material.dart';
import 'package:italianphrasereminder/views/favorites/favorites_page.dart';
import 'package:italianphrasereminder/views/flashcards/flashcards_page.dart';
import 'package:italianphrasereminder/views/profile/profile_page.dart';
import 'package:italianphrasereminder/widgets/phrase_card.dart';
import 'package:italianphrasereminder/models/phrases.dart';
import 'package:italianphrasereminder/widgets/search_bar.dart'
    // ignore: library_prefixes
    as customSearchBar;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> filteredPhrases = phrases;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Italian Phrase Reminder'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    // Navigate to the favorites page.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const FavoritesPage()),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.book),
                  onPressed: () {
                    // Navigate to Flashcards page.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const FlashcardsPage()),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.account_circle),
                  onPressed: () {
                    // Navigate to Profile page.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => ProfilePage()),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      // if phrase is part of favorites, print it here as a card
      body: Column(
        children: [
          customSearchBar.SearchBar(
            onChanged: (searchText) {
              setState(() {
                filteredPhrases = phrases
                    .where((phrase) =>
                        phrase['italian']!
                            .toLowerCase()
                            .contains(searchText.toLowerCase()) ||
                        phrase['english']!
                            .toLowerCase()
                            .contains(searchText.toLowerCase()))
                    .toList();
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPhrases.length,
              itemBuilder: (BuildContext context, int index) {
                var phrase = filteredPhrases[index];
                return PhraseCard(phrase: phrase);
              },
            ),
          )
        ],
      ),
    );
  }
}
