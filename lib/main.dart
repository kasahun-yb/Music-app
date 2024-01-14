import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/controller/controller.dart';
import 'package:musicapp/screen/homescreen.dart';
import 'package:musicapp/screen/mainPage.dart';
void main() {
    WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}


class MyApp extends StatelessWidget {

   final MyController _mycontroller=Get.put(MyController());

  // final MyController _mycontroller=Get.put(MyController());

   MyApp({super.key});
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Homepage(),
    );
  }
}