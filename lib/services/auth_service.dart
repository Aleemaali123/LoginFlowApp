// // lib/services/auth_service.dart
// import 'package:local_auth/local_auth.dart';
//
// class AuthService {
//   LocalAuthentication localAuth = LocalAuthentication();
//
//   // Simulated login method (for testing/demo purpose)
//   Future<bool> login(String username, String password) async {
//     // Simple dummy logic for login
//     if (username == 'admin' && password == 'password123' || username == 'user' && password == 'user123') {
//       return true;
//     }
//     return false;
//   }
//
//   // Biometric login method
//   Future<bool> biometricLogin() async {
//     try {
//       bool canCheckBiometrics = await localAuth.canCheckBiometrics;
//       bool isDeviceSupported = await localAuth.isDeviceSupported();
//
//       if (!canCheckBiometrics || !isDeviceSupported) {
//         return false;
//       }
//
//       bool authenticated = await localAuth.authenticate(
//         localizedReason: 'Authenticate using biometrics',
//         options: const AuthenticationOptions(
//           biometricOnly: true,
//         ),
//       );
//
//       return authenticated;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   // Logout (placeholder)
//   Future<void> logout() async {
//     // Simulate logout logic
//     await Future.delayed(const Duration(milliseconds: 500));
//   }
// }
