import 'package:flutter_application_1/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureInjectable(String env) {
  getIt.init();
}
