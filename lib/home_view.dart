import 'package:flutter/material.dart';
import 'package:sqflite_example/home_view_body.dart';
import 'package:sqflite_example/sql_db.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  SqlDb myDb = SqlDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: false,
        elevation: 5,
        actions: [
          IconButton(
            onPressed: () async => await myDb.insertData(
              "INSERT INTO notes (title, note) VALUES ('first note', 'second note')",
            ),
            icon: const Icon(Icons.add, size: 28),
          ),
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
