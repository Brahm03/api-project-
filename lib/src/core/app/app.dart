import 'package:gadgets_store_admin/src/core/router/app_router.dart';
import 'package:material_ui/material_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      debugShowCheckedModeBanner: false,
      title: 'Admin panel',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: Colors.green
        )
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppPages.home,
    );
  }
}