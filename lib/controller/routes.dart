import 'package:flutter/material.dart';

import '../view/cart_screen/cart_page.dart';
import '../view/detail_screen/detail_page.dart';
import '../view/home/home_page.dart';
import '../view/splash_screen/splash_page.dart';


class AppRoutes
{
  static Map<String, Widget Function(BuildContext)> routes={
    "/": (context)=> const HomePage(),
    "/detail":(context)=>const DetailPage(),
    "/cart":(context)=>const CartPage(),
    "/splash":(context)=>const SplashPage(),
  };
}