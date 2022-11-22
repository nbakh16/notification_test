import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController());
  } 

}