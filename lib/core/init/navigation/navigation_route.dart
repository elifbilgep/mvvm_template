import 'package:flutter/material.dart';
import '../../components/card/not_found_route.dart';
import '../../constants/navigaton/navigation_constants.dart';

import '../../../view/test/test_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute? get instance => _instance;
  //Singleton
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(const TestView());

      default:
    }
    return MaterialPageRoute(builder: (context) => const NoRouteFound());
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
