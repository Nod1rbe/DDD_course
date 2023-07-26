import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              FlushbarHelper.createError(
                  message: failure.map(
                cancelledByUser: (_) => 'Cancelled',
                serverError: (_) => 'Server eroor',
                emailAlreadyInUse: (_) => 'Email already in use',
                invalidEmailAndPasswordCombination: (_) =>
                    'Invalid email and password combination',
              )).show(context);
            },
            (_) => null,
          ),
        );
      },
      builder: (context, state) {
        return Form(
            // autovalidateMode: fals,
            child: ListView(
          children: [
            const Text(
              'notepad',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 130,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
              ),
              autocorrect: false,
              onChanged: (value) => context
                  .read<SignInFormBloc>()
                  .add(SignInFormEvent.emailChanged(value)),
              validator: (_) => state.emailAddress.value.fold(
                (f) => f.maybeMap(
                    invalidEmail: (_) => 'Invalid Email', orElse: () => null),
                (_) => null,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
              ),
              autocorrect: false,
              obscureText: true,
              onChanged: (value) => context
                  .read<SignInFormBloc>()
                  .add(SignInFormEvent.passwordChanged(value)),
              validator: (_) => state.password.value.fold(
                (f) => f.maybeMap(
                    shortPassword: (_) => 'Short Password', orElse: () => null),
                (_) => null,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      context.read<SignInFormBloc>().add(
                          SignInFormEvent.signInWithEmailAndPasswordPressed());
                    },
                    child: Text('SIGN IN'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      context.read<SignInFormBloc>().add(SignInFormEvent
                          .registerWithEmailAndPasswordPressed());
                    },
                    child: Text('REGISTER'),
                  ),
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<SignInFormBloc>()
                      .add(SignInFormEvent.signInWithGooglePressed());
                },
                child: Text(
                  'SIGN IN WITH GOOGLE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ));
      },
    );
  }
}
