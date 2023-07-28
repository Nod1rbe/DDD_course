// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:flutter_application_1/application/auth/sign_in_form/bloc/sign_in_form_bloc.dart'
    as _i7;
import 'package:flutter_application_1/domain/auth/i_auth_facade.dart' as _i5;
import 'package:flutter_application_1/infrastructure/auth/firebase_auth_facade.dart'
    as _i6;
import 'package:flutter_application_1/infrastructure/core/firebase_injectable_modul.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final fireBaseInjectableModule = _$FireBaseInjectableModule();
    gh.lazySingleton<_i3.FirebaseAuth>(
        () => fireBaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i4.GoogleSignIn>(
        () => fireBaseInjectableModule.googleSignIn);
    gh.lazySingleton<_i5.IAuthFacade>(() => _i6.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.GoogleSignIn>(),
        ));
    gh.factory<_i7.SignInFormBloc>(() => _i7.SignInFormBloc(
          gh<_i5.IAuthFacade>(),
          gh<_i7.SignInFormState>(),
        ));
    return this;
  }
}

class _$FireBaseInjectableModule extends _i8.FireBaseInjectableModule {}
