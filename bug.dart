```dart
import 'dart:async';

Future<void> main() async {
  final completer = Completer<int>();

  // Simulate an asynchronous operation that might fail.
  Timer(Duration(seconds: 2), () {
    //This will cause the error. Change 1 to 0 to fix
    if (1 == 1) {
      completer.complete(10);
    } else {
      completer.completeError(Exception('Asynchronous operation failed'));
    }
  });

  try {
    final result = await completer.future;
    print('Result: $result');
  } catch (e) {
    print('Error: $e');
  }
}
```