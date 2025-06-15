import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.offNamed(Routes.ONBOARDING); // Or Routes.LOGIN if skipping onboarding
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 150),
            SizedBox(height: 20),
            CircularProgressIndicator(color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
