import 'package:flutter/material.dart';
import 'package:sqflite_example/sql_db.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  SqlDb myDb = SqlDb();

  Future<List<Map>> readData() async {
    List<Map> response = await myDb.selectData("SELECT * FROM notes");

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FutureBuilder(
          future: readData(),
          builder: (context, AsyncSnapshot<List<Map>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text("${snapshot.data![index]['title']}"),
                    subtitle: Text("${snapshot.data![index]['note']}"),
                  ),
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ],
    );
  }
}
