import 'package:get/get.dart';

class ProfileController extends GetxController {
  // User data observables
  var name = 'Robiul Sunny Emon'.obs;
  var email = 'user@example.com'.obs;
  var avatarUrl = 'https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'.obs;

  // Function to update profile
  void updateProfile(String newName, String newEmail, String newAvatarUrl) {
    name.value = newName;
    email.value = newEmail;
    avatarUrl.value = newAvatarUrl;
  }
}