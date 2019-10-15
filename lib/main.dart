import 'package:flutter/material.dart';
import 'package:search_app/pages/detailsPage.dart';
import 'package:search_app/pages/homePage.dart';

void main() => runApp(
  MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    routes: {
      '/details_page': (context) => DetailsPage()
    },
  )
);

