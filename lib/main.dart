import 'package:flutter/material.dart';
import 'package:notif_test/view/home_page_view.dart';
import 'package:get/get.dart';

import 'bindings/bindings.dart';
import 'controllers/notification_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationController.initializeNotificationService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MyBindings(),
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
