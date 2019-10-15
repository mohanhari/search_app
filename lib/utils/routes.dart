import 'package:flutter/material.dart';
import 'package:search_app/pages/detailsPage.dart';
import 'package:search_app/utils/constants.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    Constants.ROUTE_DETAILS_PAGE : (BuildContext context) =>
        DetailsPage(),
  };
}