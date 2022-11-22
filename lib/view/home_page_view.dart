import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:notif_test/services/notification_service.dart';
import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  NotificationService myNotification = NotificationService();
  int schTime=0;

  @override
  void initState() {
    super.initState();
    myNotification.initializeNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("—Test Notification—"),
            SizedBox(height: 12,),
            ElevatedButton(
              onPressed: () {
                // myNotification.sendNotification("Notif title", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
                //     "\n1\n2\n3\n4\n5\n6");

                Get.find<NotificationController>().sendBasicNotification();
              },
              style: ElevatedButton.styleFrom(
                  elevation: 4,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white
              ),
              child: const Text("Simple Notif"),
            ),

            SizedBox(height: 12,),
            ElevatedButton(
              onPressed: () {
                // myNotification.imageNotification("Image title", "body text", "logo");

                Get.find<NotificationController>().sendImageNotification();
              },
              style: ElevatedButton.styleFrom(
                  elevation: 4,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white
              ),
              child: const Text("Image Notif"),
            ),

            SizedBox(height: 12,),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                    title: "Set Duration",
                    titleStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    content: TextFormField(
                      style: const TextStyle(fontSize: 18),
                      decoration: const InputDecoration(
                          hintText: 'Time in second',
                          prefixIcon: Icon(Icons.alarm_sharp, color: Colors.grey,size: 30,)
                      ),
                      onChanged: (value) {
                        schTime = int.parse(value);
                      },
                    ),
                    textConfirm: "Set",
                    confirmTextColor: Colors.white,
                    onConfirm: (){
                      // myNotification.scheduleNotification("Notif title",
                      //     "Showing notification after $schTime seconds", schTime);
                      Get.find<NotificationController>().sendScheduledNotification(
                        "Showing notification after $schTime seconds ${Emojis.time_alarm_clock}",
                        schTime
                      );
                      Get.back();
                    }
                );
              },
              style: ElevatedButton.styleFrom(
                  elevation: 4,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white
              ),
              child: const Text("Schedule Notif"),
            ),

            SizedBox(height: 12,),
            ElevatedButton(
              onPressed: () {
                myNotification.ongoingNotification("Title", "important body text");
              },
              style: ElevatedButton.styleFrom(
                  elevation: 4,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white
              ),
              child: const Text("Can't remove"),
            ),

            SizedBox(height: 12,),
            ElevatedButton(
              onPressed: () {
                Get.find<NotificationController>().clearAllNotifications();
              },
              style: ElevatedButton.styleFrom(
                  elevation: 4,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white
              ),
              child: const Text("Clear all"),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //
      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
