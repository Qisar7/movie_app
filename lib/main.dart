import 'package:flutter/material.dart';
import 'package:flutter_breaking/app_router.dart';
import 'package:flutter_breaking/constants/string.dart';
import 'package:flutter_breaking/presentation/screens/chracter_home.dart';

void main() {
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  MyApp({required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateroute,
    );
  }
}
