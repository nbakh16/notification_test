import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
    const BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      "static body.",
      htmlFormatBigText: true,
      contentTitle: "Flutter Big Text Notification Title",
      htmlFormatContentTitle: true,
      summaryText: "Flutter Big Text Notification Summary Text",
      htmlFormatSummaryText: true,
    );
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
        notificationDetails
    );
  }

  void scheduleNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        "Id",
        "Name",
        importance: Importance.max,
        priority: Priority.high,
    );

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails
    );

    await _flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        title,
        body,
        RepeatInterval.everyMinute,
        notificationDetails
    );
  }

  // Future<void> showBigTextNotification(String title, String body) async {
  //   const BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
  //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  //   htmlFormatBigText: true,
  //   contentTitle: "Flutter Big Text Notification Title",
  //   htmlFormatContentTitle: true,
  //   summaryText: "Flutter Big Text Notification Summary Text",
  //   htmlFormatSummaryText: true,
  //   );
  //   const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
  //   ‘channel_id’, ‘Channel Name’, ‘Channel Description’, styleInformation: bigTextStyleInformation);
  //   const NotificationDetails notificationDetails = NotificationDetails(androidNotificationDetails, null);
  //   await _flutterLocalNotificationsPlugin.show(
  //       0, title, body, notificationDetails,
  //       payload: "Destination Screen(Big Text Notification)");
  // }
}