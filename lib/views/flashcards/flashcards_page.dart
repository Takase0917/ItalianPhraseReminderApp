import 'package:flutter/material.dart';
import 'package:italianphrasereminder/models/phrases.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FlashcardsPageState createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  int currentCardIndex = 0;
  bool showEnglish = false;

  void flipCard() {
    setState(() {
      showEnglish = !showEnglish;
    });
  }

  void nextCard() {
    setState(() {
      currentCardIndex = (currentCardIndex + 1) % phrases.length;
      showEnglish = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcards'),
      ),
      body: GestureDetector(
        onTap: flipCard,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            showEnglish
                ? (phrases[currentCardIndex]['english'] ?? '')
                : (phrases[currentCardIndex]['italian'] ?? ''),
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 31, 206, 37),
        onPressed: nextCard,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
