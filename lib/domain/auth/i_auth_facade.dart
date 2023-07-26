import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/domain/auth/auth_failure.dart';
import 'package:flutter_application_1/domain/auth/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
