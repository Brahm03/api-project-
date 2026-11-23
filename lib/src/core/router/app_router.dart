import 'package:flutter/material.dart';
import 'package:gadgets_store_admin/src/features/home/screens/home_screen.dart';

class AppPages {
  static const String home = '/home';
  static const String splash = '/splash';
}

class AppRouter {
  // * naviation -> RouteSettings orqali page nomini oladi
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPages.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text('Not found 404'))),
        );
    }
  }
}
