import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/model/user_model.dart';
import '../../../routes/app_pages.dart';

class RegistrationController extends GetxController {
  // State variables
  final RxList<User> users = <User>[].obs;
  final Rx<User?> currentUser = Rx<User?>(null);
  final RxBool isLoading = false.obs;
  final RxBool isLoggedIn = false.obs;
  late final SharedPreferences _prefs;

  // Initialize with demo user
  @override
  void onInit() async {
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
    await _loadUser();

    // Add demo user if not exists
    if (users.isEmpty) {
      users.add(User(
        id: "1",
        username: "Robiul",
        email: "robiul@e.com",
        password: "12345678",
        phone: "12345678",
      ));
    }
  }

  // User Registration
  Future<bool> register({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      isLoading(true);

      if (users.any((user) => user.email == email)) {
        throw 'Email already registered';
      }

      final newUser = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        username: username,
        email: email,
        password: password,
        phone: phone,
      );

      users.add(newUser);
      await _saveUser(newUser);
      isLoggedIn.value = true;

      return true;
    } catch (e) {
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  // User Login
  Future<bool> login(String email, String password) async {
    print(email);
    print(password);
    try {
      isLoading(true);
      final user = users.firstWhere(
            (u) => u.email == email && u.password == password,
        orElse: User.empty,
      );

      if (user.id.isNotEmpty) {
        await _saveUser(user);
        isLoggedIn.value = true;
        return true;
      }
      return false;
    } catch (e) {
      throw 'Login failed: ${e.toString()}';
    } finally {
      isLoading(false);
    }
  }

  // User Logout
  Future<void> logout() async {
    await _clearUser();
    isLoggedIn.value = false;
    currentUser.value = null;
  }

  // Helper Methods
  Future<void> _loadUser() async {
    final userData = _prefs.getString('current_user');
    if (userData != null) {
      currentUser.value = User.fromJson(userData);
      isLoggedIn.value = true;
    }
  }

  Future<void> _saveUser(User user) async {
    currentUser.value = user;
    await _prefs.setString('current_user', user.toJson());
  }

  Future<void> _clearUser() async {
    await _prefs.remove('current_user');
  }
}