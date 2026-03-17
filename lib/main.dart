import 'package:flutter/material.dart';
import 'package:new_project/configs/colors.dart';
import 'package:new_project/configs/routes.dart';
import 'package:new_project/views/login.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: "/",
      getPages: routes,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ),
  );
}
