import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {

  var isLoading = false.obs;

  Future<void> login(String email, String password) async {
    try {
      isLoading(true);
      // Add your authentication logic here (Firebase/API)
      await Future.delayed(Duration(seconds: 2)); // Mock API call
      Get.offAllNamed(Routes.HOME);
    } finally {
      isLoading(false);
    }
  }

  void logout() {
    Get.offAllNamed(Routes.LOGIN);
  }
}
