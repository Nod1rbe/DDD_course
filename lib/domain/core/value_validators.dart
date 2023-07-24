import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/core/failurs.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegax =
      r"""^[a-zA-Z0-9.!#$%&'*+-/=?_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegax).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}


Either<ValueFailure<String>, String> validatePassword(String input) {
   if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}
