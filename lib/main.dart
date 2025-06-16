import 'package:dhaka_shop/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/cart/controllers/cart_controller.dart';
import 'app/modules/order_history/controllers/order_history_controller.dart';
import 'app/modules/registration/controllers/registration_controller.dart';
import 'app/modules/wishlist/controllers/wishlist_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CartController());
  Get.put(WishlistController());
  Get.put(OrderHistoryController());
  Get.put(RegistrationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dhaka Shop',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.green,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white
        ),
        cardTheme: CardThemeData(
          color: Colors.white
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.green),
            foregroundColor: WidgetStateProperty.all(Colors.white)
          )
        ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white),
                foregroundColor: WidgetStateProperty.all(Colors.green)
            )
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.green
              ),

            ),
          labelStyle: TextStyle(
            color: Colors.black
          ),

        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        )
      ),
      getPages: AppPages.routes,
      initialRoute: Routes.SPLASH,
      debugShowCheckedModeBanner: false,


    );
  }
}
