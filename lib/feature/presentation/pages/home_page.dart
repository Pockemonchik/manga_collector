import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_collector/feature/data/repositories/manga_repository_impl.dart';

import '../../domain/repositories/manga_repository.dart';
import '../bloc/manga_bloc.dart';
import '../widgets/action_buttona.dart';
import '../widgets/recomend_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Главная"),
      ),
      // body: Row(children: [
      //   ActionButtons(),
      //   RecommendList(),
      // ]),
      body:RecommendList(),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.timeline),
          label: "Timeline",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.art_track),
          label: "Some Page",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "Notifications",
        ),
      ]),
    );
  }
}
