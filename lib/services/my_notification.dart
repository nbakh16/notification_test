import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class MyNotification{
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings = AndroidInitializationSettings("logo");

  void initializeNotifications() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: _androidInitializationSettings
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      "Id",
      "Name",
      importance: Importance.max,
      priority: Priority.high,
      subText: "sub_text",
      styleInformation: BigTextStyleInformation(
        body,
        htmlFormatBigText: false,
        htmlFormatContentTitle: true,
        htmlFormatSummaryText: true,
      )
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails
    );

    await _flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        notificationDetails,
    );
  }

  void imageNotification(String title, String body, String image) async {
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        "Id",
        "Name",
        importance: Importance.max,
        priority: Priority.high,
        subText: "sub_text",
        styleInformation: BigPictureStyleInformation(
          DrawableResourceAndroidBitmap(image),
          largeIcon: DrawableResourceAndroidBitmap(image),
          htmlFormatContentTitle: true,
          htmlFormatSummaryText: true,
        )
    );

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  Future<void> scheduleNotification(String title, String body, int time) async {
    var scheduledNotificationDateTime = DateTime.now().add(Duration(seconds: time));
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      "Id",
      "Name",
      importance: Importance.max,
      priority: Priority.high,
      icon: "logo",
      largeIcon: DrawableResourceAndroidBitmap("logo"),
      enableLights: true,
      enableVibration: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails
    );

    await _flutterLocalNotificationsPlugin.schedule(
        1,
        title,
        body,
        scheduledNotificationDateTime,
        notificationDetails
    );
  }

  //using zonedSchedule
  Future<void> showScheduleNotification(String title, String body, int time) async {
    var scheduledNotificationDateTime = tz.TZDateTime.now(tz.local).add(Duration(seconds: 5));
    var androidDetails = AndroidNotificationDetails(
    "ID",
    "Name",
    icon: "logo",
    largeIcon: DrawableResourceAndroidBitmap("logo"),
    );

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidDetails
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      scheduledNotificationDateTime,
      notificationDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  Future<void> ongoingNotification(String title, String body) async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
    "ID", "Name",
    importance: Importance.max,
    priority: Priority.high,
    ongoing: true,
    autoCancel: false
    );
    const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        notificationDetails,
    );
  }
}