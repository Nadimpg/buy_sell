import 'package:buy_sellapp/UI/views/auth/forget_password.dart';
import 'package:buy_sellapp/UI/views/auth/login_screen.dart';
import 'package:buy_sellapp/UI/views/auth/registration.dart';
import 'package:buy_sellapp/UI/views/bottom_nav_controller/bottom_nav_controller.dart';
import 'package:buy_sellapp/UI/views/card_screen/card_screen.dart';
import 'package:buy_sellapp/UI/views/favourite/favourite_screen.dart';
import 'package:buy_sellapp/UI/views/home/home_screen.dart';
import 'package:buy_sellapp/UI/views/profile/profile_screen.dart';
import 'package:buy_sellapp/UI/views/splash_screen/splash_screen.dart';
import 'package:buy_sellapp/UI/views/unknown_screen/unknown_screen.dart';
import 'package:buy_sellapp/business_logic/bindings/auth_binding.dart';
import 'package:buy_sellapp/business_logic/bindings/splash_binding.dart';
import 'package:get/get.dart';

import '../views/onboarding_screen/onboarding_screen.dart';

const String splash = '/splash_screen';
const String unknown = '/not_found';
const String onboard = '/onboard';
const String login = '/Login';
const String registration = '/registration';
const String forgetPass = '/forgetpass';
const String bottomNavController = '/bottom_nav_controller';
const String cardScreen = '/card_screen';
const String homeScreen = '/home_screen';
const String favouriteScreen = '/favourite_screen';
const String profileScreen = '/profile_screen';

List<GetPage> getPages = [
  GetPage(name: unknown, page: () => const Unknown()),
  GetPage(name: splash, page: () => const SplashScreen(),binding: SplashBinding()),
  GetPage(name: onboard, page: () => const OnboardingScreen()),
  GetPage(
      name: registration,
      page: ()=>const Registration(),
      binding: AuthBinding()
  ),
  GetPage(name: forgetPass, page: ()=>const ForgetPassword(),binding: AuthBinding()),
  GetPage(
      name: login,
      page: ()=>const LoginScreen(),
      binding: AuthBinding()
  ),
  GetPage(name: bottomNavController, page: ()=> BottomNavController()),
  GetPage(name: cardScreen, page: ()=> const CardScreen()),
  GetPage(name: homeScreen, page: ()=> const HomeScreen()),
  GetPage(name: favouriteScreen, page: ()=> const FavouriteScreen()),
  GetPage(name: profileScreen, page: ()=> const ProfileScreen()),
];
