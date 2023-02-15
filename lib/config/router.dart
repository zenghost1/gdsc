import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    // ignore: avoid_print
    print('Route: ${settings.name}');

    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case ErrorScreen.routeName:
        return ErrorScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      default:
        return ErrorScreen.route();
    }
  }
}