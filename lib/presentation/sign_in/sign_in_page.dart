import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_application_1/presentation/sign_in/widgets/sign_in_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Sign In'),

      ),
      body: BlocProvider(create: (context ) => getIt<SignInFormBloc>(),
      child: SignInForm(),
      ),
    );
  }
}