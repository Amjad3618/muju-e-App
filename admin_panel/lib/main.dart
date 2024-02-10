import 'package:admin_panel/controllers/home_controller.dart';
import 'package:admin_panel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/home_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());

  Get.put(HomeController());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.blue, // Set the AppBar background color
        ),
        scaffoldBackgroundColor:
            Colors.grey[200], // Set the Scaffold background color
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.deepPurple, // Set the default button color
        ),
      ),
      home: const HomePage(),
    );
  }
}
