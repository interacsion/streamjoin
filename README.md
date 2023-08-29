A type-safe Dart library for joining multiple streams into a single stream.

By using the `join` extension, you can join multiple streams into a single stream emitting the latest
value from each stream whenever any stream emits a value:

```dart
(stream1, stream2).join
```

For a full example, see [the Example page](https://pub.dev/packages/streamjoin/example).
