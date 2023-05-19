import 'package:flutter/material.dart';
import 'package:italianphrasereminder/models/phrases.dart';
import 'package:italianphrasereminder/views/favorites/favorites_page.dart';

class ProfilePage extends StatelessWidget {
  final String username = "User";
  final int learnedPhrases = phrases.length;

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Username: $username',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              'Learned Phrases: $learnedPhrases',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoritesPage()),
                );
              },
              child: const Text('Go to Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}
