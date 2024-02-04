import 'package:apple_gadget_task/app/data/global_data/global_variable_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Initializer {
  static Future<void> init() async {

    _initGlobalLoading();
    _initRotation();

  }

  /// global loader
  static void _initGlobalLoading() {

    final globalVariableGetx = GlobalRxVariableController();
    Get.put(globalVariableGetx);

  }


  static void _initRotation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
