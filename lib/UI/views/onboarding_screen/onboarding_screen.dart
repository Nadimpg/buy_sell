import 'package:buy_sellapp/Model/intro.dart';
import 'package:buy_sellapp/UI/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';

import '../../../Const/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroScreenOnboarding(
      backgroudColor: Colors.transparent,
      introductionList: introData
          .map((e) => Introduction(
              imageHeight: 200,
              titleTextStyle:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              subTitleTextStyle:
                  TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              imageUrl: e.image,
              title: e.title,
              subTitle: e.description))
          .toList(),
      onTapSkipButton: () => Get.toNamed(login),
      foregroundColor: AppColors.mandarinColor,
    ));
  }
}
