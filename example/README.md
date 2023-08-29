```dart
Stream<String> status() async* {
  while (true) {
    yield 'off';
    await Future.delayed(const Duration(seconds: 2));
    yield 'on';
    await Future.delayed(const Duration(seconds: 2));
  }
}

Stream<int> counter() async* {
  var counter = 0;
  await Future.delayed(const Duration(seconds: 1));
  while (true) {
    yield counter++;
    await Future.delayed(const Duration(seconds: 2));
  }
}
```

---

```dart
import 'package:streamjoin/streamjoin.dart';

void main() async {
  await for (final (status, counter) in (status(), counter()).join) {
    print('status: $status, counter: $counter');
  }
}
```

or

```dart
import 'package:flutter/material.dart';
import 'package:streamjoin/streamjoin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder(
          stream: (status(), counter()).join,
          builder: (context, snapshot) {
            final (status, counter) = snapshot.data ?? (null, null);
            return Center(child: Text('status: $status, counter: $counter'));
          },
        ),
      ),
    );
  }
}
```

---

```
status: off, counter: null
status: off, counter: 0
status: on, counter: 0
status: on, counter: 1
...
```
