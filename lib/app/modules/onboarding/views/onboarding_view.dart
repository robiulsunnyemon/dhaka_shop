import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
   OnboardingView({super.key});
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              _buildPage(
                'Welcome to Dhaka Shop',
                'Your one-stop shopping solution',
                'assets/onboarding1.png',
              ),
              _buildPage(
                'Easy Shopping',
                'Browse thousands of products',
                'assets/onboarding2.png',
              ),
              _buildPage(
                'Fast Delivery',
                'Get items delivered to your doorstep',
                'assets/onboarding3.png',
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.orange,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Get.offNamed(Routes.LOGIN),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  child: Text('Get Started'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(String title, String subtitle, String image) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 250),
          SizedBox(height: 30),
          Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 15),
          Text(subtitle,
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
