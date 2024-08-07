import 'package:ch1_advance_flutter_exam/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/controlling.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HomeProvider(),),],
      builder: (context, child) => const MyApp()));
}