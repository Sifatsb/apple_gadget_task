import 'dart:convert';

import 'package:apple_gadget_task/app/routes/app_pages.dart';
import 'package:apple_gadget_task/app/utilities/message/snack_bars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {

  RxBool loginLoader = false.obs;
  TextEditingController userIdTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  bool validate() {
    String email = userIdTextController.text;
    String password = passwordTextController.text;
    if (email.isEmpty) {
      showBasicFailedSnackBar(message: 'Enter email');
      return false;
    } else if (password.isEmpty) {
      showBasicFailedSnackBar(message: 'Enter password');
      return false;
    }
    return true;
  }

  Future<void> getSignIn({required String userId, required String password}) async {

    try {
      loginLoader.value = true;

      var headers = {
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('https://peanut.ifxdb.com/api/ClientCabinetBasic/IsAccountCredentialsCorrect'));
      request.body = json.encode({
        "login": userId,
        "password": password
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var responseBody = await utf8.decoder.bind(response.stream).join();
      var jsonData = jsonDecode(responseBody);

      if (response.statusCode == 200) {
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setString('token', '${jsonData['token']}');
        Get.offAndToNamed(Routes.HOME);
      }
      else {
        debugPrint('Else :: ${response.reasonPhrase}');
        showBasicFailedSnackBar(message: response.reasonPhrase ?? 'Something went wrong');
      }



    } catch (e, t) {
      loginLoader.value = false;
      debugPrint('$e');
      debugPrint('$t');
    } finally {
      loginLoader.value = false;
    }

  }

}
