import 'package:car_catalogue/app/routes/app_pages.dart';
import 'package:car_catalogue/initializer.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  await Initializer.init();

  final String initialRoute = await Routes.INITIAL;

  runApp(App(initialRoute: initialRoute));
}
