import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/core/errors.dart';
import 'package:flutter_application_1/domain/core/failurs.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  getOrCrash() {
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UniqueId extends ValueObject<String> {
  late final Either<ValueFailure<String>, String> value;

  factory UniqueId(String input) {
    return UniqueId._(
      right(Uuid().v1())
    );
  }

  factory UniqueId.fromUniqueString(String uniqId) {
    assert(uniqId != null);
    return UniqueId._(right(uniqId));
  }
}
