import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{
  static void initializeNotificationService(){
    AwesomeNotifications().initialize(
      null, //null uses app icon
      [
        NotificationChannel(
          channelKey: "my_channelKey",
          channelName: "my_channelName",
          channelDescription: "my_channelDescription",
          channelShowBadge: true,
          defaultColor: Colors.deepPurple,
          enableLights: true,
          enableVibration: true,
          importance: NotificationImportance.Max
        ),
      ]
    );
  }

  Future<void> sendBasicNotification() async {
    AwesomeNotifications().createNotification(content: NotificationContent(
      id: 0,
      channelKey: "my_channelKey",
      title: "basic title",
      body: "basic body ${Emojis.smile_alien}"
    ));
  }

  Future<void> sendImageNotification() async {
    AwesomeNotifications().createNotification(content: NotificationContent(
      id: 1,
      channelKey: "my_channelKey",
      title: "basic title",
      body: "Image notification ${Emojis.smile_alien}",
      notificationLayout: NotificationLayout.BigPicture,
      bigPicture: "https://images.pexels.com/photos/219692/pexels-photo-219692.jpeg"
    ));
  }

  Future<void> sendScheduledNotification(String body, int time) async {
    AwesomeNotifications().createNotification(content: NotificationContent(
      id: 2,
      channelKey: "my_channelKey",
      title: "basic title",
      body: body,
    ),

    schedule: NotificationInterval(
      interval: time,
      repeats: false,
      timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier()

    )
    );
  }

  Future<void> clearAllNotifications() async {
    await AwesomeNotifications().cancelAll();
  }

  @override
  void onInit() {
    super.onInit();

    //request to show notifications
    AwesomeNotifications().isNotificationAllowed().then((isAllowed){
      if(!isAllowed){
        ///TODO: show dialog for better ux

        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    }
    );
    //
    // //listen to different actions
    // AwesomeNotifications()
    //     .actionStream
    //     .listen((ReceivedNotification receievedNotification){
    //
    //
    // }
    // );
  }

}