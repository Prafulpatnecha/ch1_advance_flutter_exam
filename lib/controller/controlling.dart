import 'package:ch1_advance_flutter_exam/controller/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/splash",
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
    );
  }
}
