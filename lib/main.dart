import 'package:flutter/material.dart';
import 'package:sqflite_example/home_view.dart';

void main(List<String> args) {
  runApp(const SqfLiteExample());
}

class SqfLiteExample extends StatelessWidget {
  const SqfLiteExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      theme: ThemeData.dark(),
    );
  }
}
