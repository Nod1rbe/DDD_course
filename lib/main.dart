import 'package:flutter/material.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_application_1/presentation/core/app_widget.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureInjectable(Environment.prod);
  runApp(const AppWidget());
}
