import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHandlerService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // tipe: simpel, bigPicture
  final String tipeNotifikasi = 'simpel';

  void initialize() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // const AndroidNotificationChannel channel = AndroidNotificationChannel(
    //   'your_channel_id',
    //   'your_channel_name',
    // );
    // _flutterLocalNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<
    //         AndroidFlutterLocalNotificationsPlugin>()
    //     ?.createNotificationChannel(channel);
  }

  Future<void> showNotification({tipeNotifikasi}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'your_channel_id',
          'your_channel_name',
          channelDescription: 'your_channel_description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          sound:
              tipeNotifikasi == 'bigPicture'
                  ? RawResourceAndroidNotificationSound('software_close')
                  : null,
          styleInformation:
              tipeNotifikasi == 'bigPicture'
                  ? BigPictureStyleInformation(
                    DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
                    contentTitle: 'Notifikasi gambar',
                    summaryText: 'Ini notifikasi gambar dengan ringkasan.',
                  )
                  : null,
          actions: <AndroidNotificationAction>[
            AndroidNotificationAction(
              '_action_1',
              'ini title',
              icon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
              contextual: true,
            ),
          ],
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
