import 'package:flutter/material.dart';
import 'package:notif_test/services/my_notification.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  MyNotification myNotification = MyNotification();

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
              },
              style: ElevatedButton.styleFrom(
                  elevation: 4,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white
              ),
              child: const Text("Push Notif"),
            ),
            SizedBox(height: 12,),
            ElevatedButton(
              onPressed: () {
                myNotification.sendNotification("Notif title", "The body of scheduled");
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
