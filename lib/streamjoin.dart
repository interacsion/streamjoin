import 'dart:async';

/// Joins multiple [Stream]s into a single [Stream] emitting the latest value
/// from each [Stream] whenever any [Stream] emits a value.
///
/// Consider using the `join` extension instead, as it offers a type-safe
/// alternative:
/// ```dart
/// (stream1, stream2).join
/// ```
Stream<List<T?>> streamJoin<T>(Iterable<Stream<T>> streams) {
  final controller = StreamController<List<T?>>();

  final subscriptions = <StreamSubscription<T>>[];

  controller
    ..onListen = () {
      final values = List<T?>.filled(streams.length, null);

      for (final (index, stream) in streams.indexed) {
        final subscription = stream.listen((event) {
          values[index] = event;
          controller.add(values);
        });

        subscriptions.add(subscription);
      }
    }
    ..onPause = () {
      for (final subscription in subscriptions) {
        subscription.pause();
      }
    }
    ..onResume = () {
      for (final subscription in subscriptions) {
        subscription.resume();
      }
    }
    ..onCancel = () async {
      for (final subscription in subscriptions) {
        await subscription.cancel();
      }

      await controller.close();
    };

  return controller.stream;
}

/// Join records of [Stream]s.
extension Join2<T1, T2> on (
  Stream<T1>,
  Stream<T2>,
) {
  /// Joins multiple [Stream]s into a single [Stream] emitting the latest value
  /// from each [Stream] whenever any [Stream] emits a value.
  Stream<(T1?, T2?)> get join => streamJoin([
        this.$1,
        this.$2,
      ]).map(
        (event) => (
          event[0] as T1?,
          event[1] as T2?,
        ),
      );
}

/// Join records of [Stream]s.
extension Join3<T1, T2, T3> on (
  Stream<T1>,
  Stream<T2>,
  Stream<T3>,
) {
  /// Joins multiple [Stream]s into a single [Stream] emitting the latest value
  /// from each [Stream] whenever any [Stream] emits a value.
  Stream<(T1?, T2?, T3?)> get join => streamJoin([
        this.$1,
        this.$2,
        this.$3,
      ]).map(
        (event) => (
          event[0] as T1?,
          event[1] as T2?,
          event[2] as T3?,
        ),
      );
}

/// Join records of [Stream]s.
extension Join4<T1, T2, T3, T4> on (
  Stream<T1>,
  Stream<T2>,
  Stream<T3>,
  Stream<T4>,
) {
  /// Joins multiple [Stream]s into a single [Stream] emitting the latest value
  /// from each [Stream] whenever any [Stream] emits a value.
  Stream<(T1?, T2?, T3?, T4?)> get join => streamJoin([
        this.$1,
        this.$2,
        this.$3,
        this.$4,
      ]).map(
        (event) => (
          event[0] as T1?,
          event[1] as T2?,
          event[2] as T3?,
          event[3] as T4?,
        ),
      );
}

/// Join records of [Stream]s.
extension Join5<T1, T2, T3, T4, T5> on (
  Stream<T1>,
  Stream<T2>,
  Stream<T3>,
  Stream<T4>,
  Stream<T5>,
) {
  /// Joins multiple [Stream]s into a single [Stream] emitting the latest value
  /// from each [Stream] whenever any [Stream] emits a value.
  Stream<(T1?, T2?, T3?, T4?, T5?)> get join => streamJoin([
        this.$1,
        this.$2,
        this.$3,
        this.$4,
        this.$5,
      ]).map(
        (event) => (
          event[0] as T1?,
          event[1] as T2?,
          event[2] as T3?,
          event[3] as T4?,
          event[4] as T5?,
        ),
      );
}

/// Join records of [Stream]s.
extension Join6<T1, T2, T3, T4, T5, T6> on (
  Stream<T1>,
  Stream<T2>,
  Stream<T3>,
  Stream<T4>,
  Stream<T5>,
  Stream<T6>,
) {
  /// Joins multiple [Stream]s into a single [Stream] emitting the latest value
  /// from each [Stream] whenever any [Stream] emits a value.
  Stream<(T1?, T2?, T3?, T4?, T5?, T6?)> get join => streamJoin([
        this.$1,
        this.$2,
        this.$3,
        this.$4,
        this.$5,
        this.$6,
      ]).map(
        (event) => (
          event[0] as T1?,
          event[1] as T2?,
          event[2] as T3?,
          event[3] as T4?,
          event[4] as T5?,
          event[5] as T6?,
        ),
      );
}

/// Join records of [Stream]s.
extension Join7<T1, T2, T3, T4, T5, T6, T7> on (
  Stream<T1>,
  Stream<T2>,
  Stream<T3>,
  Stream<T4>,
  Stream<T5>,
  Stream<T6>,
  Stream<T7>,
) {
  /// Joins multiple [Stream]s into a single [Stream] emitting the latest value
  /// from each [Stream] whenever any [Stream] emits a value.
  Stream<(T1?, T2?, T3?, T4?, T5?, T6?, T7?)> get join => streamJoin([
        this.$1,
        this.$2,
        this.$3,
        this.$4,
        this.$5,
        this.$6,
        this.$7,
      ]).map(
        (event) => (
          event[0] as T1?,
          event[1] as T2?,
          event[2] as T3?,
          event[3] as T4?,
          event[4] as T5?,
          event[5] as T6?,
          event[6] as T7?,
        ),
      );
}

/// Join records of [Stream]s.
extension Join8<T1, T2, T3, T4, T5, T6, T7, T8> on (
  Stream<T1>,
  Stream<T2>,
  Stream<T3>,
  Stream<T4>,
  Stream<T5>,
  Stream<T6>,
  Stream<T7>,
  Stream<T8>,
) {
  /// Joins multiple [Stream]s into a single [Stream] emitting the latest value
  /// from each [Stream] whenever any [Stream] emits a value.
  Stream<(T1?, T2?, T3?, T4?, T5?, T6?, T7?, T8?)> get join => streamJoin(
        [
          this.$1,
          this.$2,
          this.$3,
          this.$4,
          this.$5,
          this.$6,
          this.$7,
          this.$8,
        ],
      ).map(
        (event) => (
          event[0] as T1?,
          event[1] as T2?,
          event[2] as T3?,
          event[3] as T4?,
          event[4] as T5?,
          event[5] as T6?,
          event[6] as T7?,
          event[7] as T8?,
        ),
      );
}

/// Join records of [Stream]s.
extension Join9<T1, T2, T3, T4, T5, T6, T7, T8, T9> on (
  Stream<T1>,
  Stream<T2>,
  Stream<T3>,
  Stream<T4>,
  Stream<T5>,
  Stream<T6>,
  Stream<T7>,
  Stream<T8>,
  Stream<T9>,
) {
  /// Joins multiple [Stream]s into a single [Stream] emitting the latest value
  /// from each [Stream] whenever any [Stream] emits a value.
  Stream<(T1?, T2?, T3?, T4?, T5?, T6?, T7?, T8?, T9?)> get join => streamJoin(
        [
          this.$1,
          this.$2,
          this.$3,
          this.$4,
          this.$5,
          this.$6,
          this.$7,
          this.$8,
          this.$9,
        ],
      ).map(
        (event) => (
          event[0] as T1?,
          event[1] as T2?,
          event[2] as T3?,
          event[3] as T4?,
          event[4] as T5?,
          event[5] as T6?,
          event[6] as T7?,
          event[7] as T8?,
          event[8] as T9?,
        ),
      );
}
