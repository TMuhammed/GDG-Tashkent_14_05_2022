import 'package:flutter/material.dart';

import 'examples/example_1.dart';
import 'examples/example_2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Isolates',
      // home: Example1(),
      home: Example2(),
    );
  }
}
