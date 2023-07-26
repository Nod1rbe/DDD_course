import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/sign_in/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.green[800],
      
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8)
          )
        )
      ),
   debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}
