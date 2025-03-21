import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHandlerService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // simpel, bigPicture
  final String tipeNotifikasi = 'simpel';

  void initialize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Future<void> show

  Future<void> showNotification({
    tipeNotifikasi,
  }) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'your_channel_id',
          'your_channel_name',
          channelDescription: 'your_channel_description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          styleInformation: tipeNotifikasi == 'bigPicture'
          ? BigPictureStyleInformation(
            DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
            contentTitle: 'Notifikasi gambar',
            summaryText: 'Ini notifikasi gambar dengan ringkasan.',
          )
          : null,
        );
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await _flutterLocalNotificationsPlugin.show(
      0,
      'Notifikasi Sederhana',
      'Ini adalah notifikasi yang muncul ketika tombol ditekan.',
      platformChannelSpecifics,
    );
  }


}
