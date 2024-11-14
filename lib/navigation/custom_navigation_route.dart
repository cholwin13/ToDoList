import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list/pages/new_task_screen.dart';
import 'package:to_do_list/widgets/new_task_route_parameters.dart';

import '../pages/home_screen.dart';

class CustomNavigationRoute {
  static String initRoute = '/';

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
  GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: initRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
            path: '/newTask',
          builder: (BuildContext context, GoRouterState state){
              return NewTaskScreen(
                arguments: state.extra as NewTaskRouteParameter
              );
          }
        )
      ]
    )
  ]);

}