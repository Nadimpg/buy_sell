import 'dart:async';

import 'package:buy_sellapp/UI/route/route.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController{
  final box=GetStorage();
  chooseScreen(){
    var value=box.read('user');
    if(value['uid']==null){
      Get.offAndToNamed(onboard);
    }else{
      Get.offAndToNamed(bottomNavController);
    }
  }

  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () => chooseScreen());
    super.onInit();
  }
}
