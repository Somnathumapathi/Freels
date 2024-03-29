import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freels/controllers/auth_controller.dart';
import 'package:freels/views/screens/auth/login_screen.dart';
import 'package:freels/views/screens/auth/signin_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
