import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../screens/bottom_bar.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;
  String? _errorMessage;
  bool _isAuthenticated = false;
  bool _isLoggedIn = false;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final storedUsername = prefs.getString('username');
    if (_isLoggedIn && storedUsername != null) {
      _user = User(username: storedUsername);
      _isAuthenticated = true;
    }
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    if ((username == 'admin' && password == 'password123') ||
        (username == 'user' && password == 'user123')) {
      _user = User(username: username);
      _isAuthenticated = true;
      _isLoggedIn = true;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('username', username);

      _isLoading = false;
      notifyListeners();
      return true;
    } else {
      _errorMessage = "Invalid credentials";
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> biometricLogin(BuildContext context) async {
    final auth = LocalAuthentication();
    final isDeviceSupported = await auth.isDeviceSupported();
    final canCheck = await auth.canCheckBiometrics;
    final available = await auth.getAvailableBiometrics();

    if (!isDeviceSupported || !canCheck || available.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Biometric Setup Required"),
          content: const Text(
              "No fingerprint or face unlock is set up on this device. Please add it in device settings."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return false;
    }

    try {
      final didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to login',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      if (didAuthenticate) {
        final prefs = await SharedPreferences.getInstance();
        final storedUsername = prefs.getString('username') ?? 'user';
        _user = User(username: storedUsername);
        _isAuthenticated = true;
        _isLoggedIn = true;
        notifyListeners();

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const BottomBar()),
          (route) => false,
        );
        return true;
      }

      return false;
    } catch (e) {
      debugPrint('Biometric error: $e');
      return false;
    }
  }

  Future<void> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('username');
    await prefs.setBool('use_fingerprint', false);
    _user = null;
    _isAuthenticated = false;
    _isLoggedIn = false;
    notifyListeners();
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final storedUsername = prefs.getString('username');
    if (_isLoggedIn && storedUsername != null) {
      _user = User(username: storedUsername);
      _isAuthenticated = true;
    }
    notifyListeners();
  }
}
