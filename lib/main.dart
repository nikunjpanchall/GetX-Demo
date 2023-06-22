import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/controller_biniding.dart';
import 'package:getx_demo/models/message.dart';
import 'package:getx_demo/screens/demo.dart';
import 'package:getx_demo/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: const Locale("en", "US"),
      fallbackLocale: const Locale("en", "US"),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      initialBinding: AllControllerBindings(),
      getPages: [
        GetPage(
          name: "/",
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: "/details",
          page: () => DetailsScreen(),
        )
      ],
    );
  }
}
