import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LibPage extends StatelessWidget {
  const LibPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Библиотека"),

        ),
        body: Text("lib")
    );
  }

}