import 'package:buy_sellapp/Const/app_colors.dart';
import 'package:buy_sellapp/UI/responsive/size_config.dart';
import 'package:buy_sellapp/UI/route/route.dart';
import 'package:buy_sellapp/UI/widgets/custom_button.dart';
import 'package:buy_sellapp/UI/widgets/custom_text_field.dart';
import 'package:buy_sellapp/business_logic/controllers/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RxBool _value = false.obs;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: SizeConfig.screenHeight,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/logos/logo.png',
                    width: 40.w,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sign Up',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customFormField(
                      TextInputType.text, _nameController, context, 'Name',
                      (val) {
                    if (val.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                  }, prefixIcon: Icons.person_2_outlined),
                  customFormField(TextInputType.emailAddress, _emailController,
                      context, 'Email', (val) {
                    if (val.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                    if (!val.contains(RegExp(r'\@'))) {
                      return 'enter a valid email address';
                    }
                  }, prefixIcon: Icons.email_outlined),
                  customFormField(TextInputType.text, _passwordController,
                      context, 'Password', (val) {
                    if (val.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                  },
                      prefixIcon: Icons.remove_red_eye_outlined,
                      obscureText: true),
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                            value: _value.value,
                            onChanged: (val) {
                              _value.value = val!;
                            }),
                      ),
                      const Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'I accept all the',
                            style: TextStyle(color: AppColors.grayColor)),
                        TextSpan(
                            /*recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.toNamed(terms),*/
                            text: ' Terms & Condition',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ]))
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      width: 200,
                      height: 45,
                      child: customButton(
                        'Sign Up',
                        () {
                          if (_formKey.currentState!.validate() &&
                              _value.value == true) {
                            Get.find<AuthController>().signup(
                                _nameController.text,
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                                context);
                          } else {
                            print('failed');
                          }
                        },
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                      Text('  OR  '),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: Ink(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.grayColor.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset('assets/logos/facebook.png'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: Ink(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.grayColor.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset('assets/logos/search.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text.rich(TextSpan(children: [
                    const TextSpan(
                        text: 'Already have an account?',
                        style: TextStyle(color: AppColors.grayColor)),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(login),
                        text: ' Login',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                  ]))
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
