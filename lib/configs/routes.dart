import 'package:get/get.dart';
import 'package:new_project/views/login.dart';
import 'package:new_project/views/signup.dart';
import 'package:new_project/views/homescreen.dart';
import 'package:new_project/views/analytics.dart';
import 'package:new_project/views/alerts.dart';
import 'package:new_project/views/settings.dart';
import 'package:new_project/views/editprofile.dart';

// ─────────────────────────────────────────────────────────────────────────────
// APP ROUTES
// '/'              → LoginScreen   (app entry point)
// '/signup'        → SignupScreen
// '/homescreen'    → HomeScreen    (main app, after login)
// '/analytics'     → AnalyticsPage
// '/alerts'        → AlertsPage
// '/settings'      → SettingsPage
// '/edit-profile'  → EditProfilePage  (pushed from Settings)
// ─────────────────────────────────────────────────────────────────────────────
var routes = [
  GetPage(name: '/', page: () => const LoginScreen()),
  GetPage(name: '/signup', page: () => const SignupScreen()),
  GetPage(name: '/homescreen', page: () => const HomeScreen()),
  GetPage(name: '/analytics', page: () => const AnalyticsPage()),
  GetPage(name: '/alerts', page: () => const AlertsPage()),
  GetPage(name: '/settings', page: () => const SettingsPage()),
  GetPage(name: '/edit-profile', page: () => const EditProfilePage()),
];
