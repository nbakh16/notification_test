import 'package:flutter/material.dart';
import 'package:notif_test/services/my_notification.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  MyNotification myNotification = MyNotification();
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
            Text("Home Page"),
            SizedBox(height: 12,),
            ElevatedButton(
              onPressed: () {
                myNotification.sendNotification("Notif title", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
                    "\n1\n2\n3\n4\n5\n6");
                // myNotification.showOngoingNotification();
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
                myNotification.imageNotification("Image title", "body text", "logo");
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
                          hintText: 'time',
                          prefixIcon: Icon(Icons.alarm_sharp, color: Colors.grey,size: 30,)
                      ),
                      onChanged: (value) {
                        schTime = int.parse(value);
                      },
                    ),
                    textConfirm: "Set",
                    confirmTextColor: Colors.white,
                    onConfirm: (){
                      myNotification.scheduleNotification("Notif title", "The body of scheduled", schTime);
                      Get.back();
                    }
                );
                // myNotification.scheduleNotification("Notif title", "The body of scheduled", 6);
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
