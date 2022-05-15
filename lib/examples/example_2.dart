
import 'package:flutter/material.dart';
import 'package:presentation_isolates/examples/worker.dart';

class Example2 extends StatefulWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {

  final TextEditingController controller = TextEditingController();
  final Worker worker = Worker();

  String result = '';
  bool isLoading = false;

  Future<void> _calculate() async {
    setState(() => isLoading = true);

    result = await worker.getDataWithIsolate(controller.text);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example 2')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            'Fibonacci is: $result',
            style: Theme.of(context).textTheme.headline6,
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: controller,
            ),
          ),

          if (isLoading)
            const CircularProgressIndicator()
          else
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Get result')
            )
        ],
      ),
    );
  }
}
