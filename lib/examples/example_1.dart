
import 'dart:io';

// import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  const Example1({Key? key}) : super(key: key);

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {

  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const CircularProgressIndicator(),

            const SizedBox(height: 16),

            ElevatedButton(
              // onPressed: () => userService.foo(5),
              onPressed: () => compute(userService.foo, 5),
              child: const Text('Impact on event loop')
            )
          ],
        ),
      ),
    );
  }
}

class UserService {
  Future<void> foo(int arg) async {
    for (int i = 0; i < arg; i++) {
      sleep(const Duration(seconds: 1));
      print('index = $i');
    }
  }
}
