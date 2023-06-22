import 'dart:ui';

import 'package:get/get.dart';
import 'package:getx_demo/models/student.dart';

class MyController extends GetxController {
  final student = Student(name: "name", age: 02).obs;
  var count = 0;

  void convertToUpperCase() async {
    await Future.delayed(const Duration(seconds: 2));
    student.update((student) {
      student?.name = student.name?.toUpperCase();
    });
    update(
      ["changeTxt"],
    );
  }

  void increment() async {
    await Future.delayed(const Duration(seconds: 2));
    count++;
    update(
      ["changeTxt"],
    );
  }

  void changeLanguage(String param1, String param2) {
    var local = Locale(param1, param2);
    Get.updateLocale(local);
  }

  @override
  void onInit() {
    print("init state Called");
    increment();
    convertToUpperCase();
    super.onInit();
  }
}
