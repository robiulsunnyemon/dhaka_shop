import 'package:dhaka_shop/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/cart/controllers/cart_controller.dart';
import 'app/modules/order_history/controllers/order_history_controller.dart';
import 'app/modules/wishlist/controllers/wishlist_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CartController());
  Get.put(WishlistController());
  Get.put(OrderHistoryController());
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
        primaryColor: Colors.green,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.withValues(alpha: .4)
        ),
        cardTheme: CardThemeData(
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.green),
            foregroundColor: WidgetStateProperty.all(Colors.white)
          )
        )
      ),
      getPages: AppPages.routes,
      initialRoute: Routes.BOTTOM_NAVIGATION_BAR,
      debugShowCheckedModeBanner: false,

    );
  }
}
