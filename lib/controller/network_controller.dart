import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  RxInt connectionStatus = 0.obs;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _subscription;
  @override
  void onInit() {
    initConnectivity();
    _subscription = connectivity.onConnectivityChanged.listen(updateConnectionStatus);
    super.onInit();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return updateConnectionStatus(result!);
  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;
        break;
      default:
        Get.snackbar("Network Error", "Failed to get Network Connection");
    }
  }
}
