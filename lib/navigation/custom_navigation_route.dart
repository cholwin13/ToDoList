import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_screen.dart';

class CustomNavigationRoute {
  static String initRoute = '/';

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
  GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: initRoute,
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen();
      },
      routes: [

      ]
    )
  ]);

}