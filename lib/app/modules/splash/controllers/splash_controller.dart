import 'package:apple_gadget_task/app/data/global_data/global_variable_controller.dart';
import 'package:apple_gadget_task/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  @override
  void onInit() {
    _animation();
    navNextPage();
    super.onInit();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  Animation? animation;
  AnimationController? animationController;

  _animation() {
    animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 60.0, end: 120.0).animate(animationController!);
    animationController?.forward();
  }

  void navNextPage() async {
    await 3000.milliseconds.delay();
    final sharedPref = await SharedPreferences.getInstance();
    Get.find<GlobalRxVariableController>().token.value = sharedPref.getString('token');
    print('::: ${Get.find<GlobalRxVariableController>().token.value}');
    if (Get.find<GlobalRxVariableController>()
        .token.value != null) {
      Get.offAndToNamed(Routes.HOME);
    } else {
      Get.offAndToNamed(Routes.LOGIN);
    }
  }

}
