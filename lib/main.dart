import 'package:flutter/material.dart';
import 'package:manga_collector/feature/presentation/pages/home_page.dart';

import 'feature/presentation/pages/lib_page.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.blueAccent,
  ),
  initialRoute: '/',
  routes: {
    '/':(context) => HomePage(),
    '/lib': (context) => LibPage()
  },
));
