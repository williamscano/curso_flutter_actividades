import 'package:flutter/material.dart';
import 'package:random_name_generator/random_name_generator.dart';

class PeopleList extends StatefulWidget {
  const PeopleList({super.key});
  @override
  State<PeopleList> createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  final _randomNames = RandomNames(Zone.catalonia);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _suggestions.length + 1,
      separatorBuilder: (context, i) => const Divider(height: 1),
      itemBuilder: (context, i) {
        if (i >= _suggestions.length) {
          for (var j = 0; j < 10; j++) {
            _suggestions.add(_randomNames.fullName());
          }
        }

        //
        return ListTile(
          title: Text(
            _suggestions[i],
            style: _biggerFont.copyWith(color: i.isOdd ? Colors.red : null),
          ),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Has tocat: ${_suggestions[i]}')),
            );
          },
        );
      },
    );
  }
}
