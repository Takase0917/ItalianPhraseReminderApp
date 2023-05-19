import 'package:flutter/foundation.dart';

class FavoritesModel extends ChangeNotifier {
  final List<Map<String, String>> _favorites = [];

  List<Map<String, String>> get favorites => _favorites;

  void add(Map<String, String> phrase) {
    _favorites.add(phrase);
    notifyListeners();
  }

  void remove(Map<String, String> phrase) {
    _favorites.removeWhere((element) => element == phrase);
    notifyListeners();
  }

  bool contains(Map<String, String> phrase) => _favorites.contains(phrase);
}
