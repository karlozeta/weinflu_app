import 'package:flutter/material.dart';
import 'package:weinflu_app/config/app_routes.dart';
import 'package:weinflu_app/design/themes.dart';
import 'package:weinflu_app/pages/all_transactions.dart';
import 'package:weinflu_app/pages/home_page.dart';
import 'package:weinflu_app/pages/login_page.dart';
import 'package:weinflu_app/pages/new_page.dart';
import 'package:weinflu_app/pages/singin_page.dart';

class WeinFluApp extends StatelessWidget {
  const WeinFluApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: WeinFluThemes.defaultTheme,
      // home: const HomePage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.newPage:
            return MaterialPageRoute(builder: (context) => const NewPage());
          case AppRoutes.home:
            return MaterialPageRoute(builder: (context) => HomePage(storeName: settings.arguments as String,));
          case AppRoutes.singin:
            return MaterialPageRoute(builder: (context) => const SingInPage());
          case AppRoutes.allTransactions:
          return MaterialPageRoute(builder: (context) => const AllTransactions());
          default:
            return MaterialPageRoute(builder: (context) => const LoginPage());
        }
      },
    );
  }
}
