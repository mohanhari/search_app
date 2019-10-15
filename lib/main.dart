import 'package:flutter/material.dart';
import 'package:search_app/pages/homePage.dart';
import 'package:search_app/utils/routes.dart';

void main() => runApp(
  MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    routes: Routes.routes,
    theme: ThemeData(
    // Define the default brightness and colors.
      brightness: Brightness.light,
      primaryColor: Colors.lightBlue[800],
      accentColor: Colors.cyan[600],
    ),
  )
);

