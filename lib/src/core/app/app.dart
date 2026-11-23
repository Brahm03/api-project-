import 'package:flutter/material.dart';
import 'package:gadgets_store_admin/src/core/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin panel',
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppPages.home,
    );
  }
}