import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/navigation/custom_navigation_route.dart';
import 'package:to_do_list/resources/app_images.dart';
import 'package:to_do_list/resources/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset(AppImages.splashImage),
        nextScreen: const MainScreen(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 1000,
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
     routerConfig: CustomNavigationRoute.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

