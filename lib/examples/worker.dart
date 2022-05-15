
import 'dart:isolate';

class Worker {
  Future<String> getDataWithIsolate(String fibonacci) async {
    final ReceivePort receivePort = ReceivePort();
    final Isolate isolate = await Isolate.spawn(
      _calculateFibonacciWithIsolate,
      [receivePort.sendPort, fibonacci]
    );

    final String result = await receivePort.first;

    receivePort.close();
    isolate.kill(priority: Isolate.immediate);

    return result;
  }

  void _calculateFibonacciWithIsolate(List<dynamic> values) {
    final SendPort sendPort = values[0];
    final int fibonacci = int.tryParse(values[1].toString()) ?? 1;

    final int fibonacciResult = _fibonacci(fibonacci);

    sendPort.send(fibonacciResult.toString());
  }

  Future<String> getDataWithoutIsolate(String fibonacci) async {
    return _calculateFibonacciWithoutIsolate(fibonacci);
  }

  String _calculateFibonacciWithoutIsolate(String fibonacci) {
    return _fibonacci(int.parse(fibonacci)).toString();
  }

  int _fibonacci(int n) {
    return n < 2 ? n : (_fibonacci(n - 1) + _fibonacci(n - 2));
  }
}
