import 'package:flutter/material.dart';
import 'people_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicació de noms aleatoris',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 1, 31, 56),
          foregroundColor: Colors.white,
          title: const Text('Aplicació de noms aleatoris'),
        ),
        body: const PeopleList(),
      ),
    );
  }
}
