import 'package:buy_sellapp/UI/views/auth/login_screen/login_screen.dart';
import 'package:buy_sellapp/UI/views/splash_screen/splash_screen.dart';
import 'package:buy_sellapp/UI/views/unknown_screen/unknown_screen.dart';
import 'package:get/get.dart';

import '../views/onboarding_screen/onboarding_screen.dart';

const String splash = '/splash_screen';
const String unknown = '/not_found';
const String onboard = '/onboard';
const String login = '/Login';

List<GetPage> getPages = [
  GetPage(name: unknown, page: () => Unknown()),
  GetPage(name: splash, page: () => const SplashScreen()),
  GetPage(name: onboard, page: () => OnboardingScreen()),
  GetPage(name: login, page: () => LogInScreen())
];
