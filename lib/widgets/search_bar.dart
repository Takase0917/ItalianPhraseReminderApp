import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const SearchBar({Key? key, required this.onChanged}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _filter = TextEditingController();

  String _searchText = "";

  _SearchBarState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
      widget.onChanged(_searchText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _filter,
        decoration: const InputDecoration(
            labelText: 'Search',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            )),
      ),
    );
  }
}
