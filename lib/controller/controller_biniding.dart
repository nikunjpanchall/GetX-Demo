import 'package:get/get.dart';
import 'package:getx_demo/controller/controller.dart';
import 'package:getx_demo/controller/network_controller.dart';

class AllControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<MyController>(MyController());
    Get.put<NetworkController>(NetworkController());
  }
}
