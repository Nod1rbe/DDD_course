import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/auth/auth_failure.dart';
import 'package:flutter_application_1/domain/auth/i_auth_facade.dart';
import 'package:flutter_application_1/domain/auth/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  // ignore: unused_field
  final IAuthFacade _authFacade;
  
  SignInFormBloc( this._authFacade ,super.initialState);

  SignInFormState get initialState => SignInFormState.initial();

  Stream<SignInFormState> mapEventToState (
    SignInFormEvent event,
  ) async* {
     
  }
}
