import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/controller.dart';
import 'package:getx_demo/controller/network_controller.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(Get.find<NetworkController>().connectionStatus.value == 1
                  ? "Connection State is Wifi"
                  : Get.find<NetworkController>().connectionStatus.value == 1
                      ? "Connection State is Mobile Data"
                      : "No Connection"),
            ),
            Text(
              "hello".tr,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            GetBuilder<MyController>(
              id: "changeTxt",
              builder: (controller) {
                return Text("Student Name : ${controller.student.value.name} \n "
                    "Student Age : ${controller.student.value.age} \n Count : ${controller.count}");
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Back to HomePage"),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.find<MyController>().changeLanguage('en', 'US');
                  },
                  child: const Text("English"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.find<MyController>().changeLanguage("hi", "IN");
                  },
                  child: const Text("Hindi"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.find<MyController>().changeLanguage("fr", "FR");
                  },
                  child: const Text("French"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "Hello",
                  "This Is SnackBar Message",
                  snackPosition: SnackPosition.BOTTOM,
                  isDismissible: true,
                  dismissDirection: DismissDirection.horizontal,
                  forwardAnimationCurve: Curves.easeIn,
                  duration: const Duration(seconds: 2),
                  overlayBlur: 5,
                );
              },
              child: const Text("Show SnackBar"),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "Hello",
                  content: const Text("Its Simple Dialog Box"),
                  textConfirm: "Yes",
                  textCancel: "No",
                  onCancel: () {
                    Get.back();
                  },
                );
              },
              child: const Text("Show Dialog"),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Wrap(
                      children: [
                        ListTile(
                            leading: const Icon(Icons.wb_sunny_outlined),
                            title: const Text("Light Theme"),
                            onTap: () {
                              Get.changeTheme(
                                ThemeData.light(useMaterial3: true),
                              );
                            }),
                        ListTile(
                          leading: const Icon(Icons.wb_sunny),
                          title: const Text("Dark Theme"),
                          onTap: () {
                            Get.changeTheme(
                              ThemeData.dark(useMaterial3: true),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.white,
                );
              },
              child: const Text("Show BottomSheet"),
            ),
          ],
        ),
      ),
    );
  }
}
