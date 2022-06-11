import 'package:flutter/material.dart';

import '../joke/joke.dart';
import '../splash/splash.dart';

class RouteUtil {
  static const String initial = '/';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return JokePage.getRoute(settings);
      default:
        return SplashPage.getRoute(settings);
    }
  }
}
