import 'package:flutter/material.dart';
import 'package:myapp/services/notification_handler_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NotificationDemo());
  }
}

class NotificationDemo extends StatefulWidget {
  @override
  State<NotificationDemo> createState() => _NotificationDemoState();
}

class _NotificationDemoState extends State<NotificationDemo> {
  final NotificationHandlerService _notificationHandlerService =
      NotificationHandlerService();

  @override
  void initState() {
    super.initState();
    _notificationHandlerService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo Notifikasi')),
      body:
      Center(
        child:
      Column(
        children: [
          ElevatedButton(
            onPressed: () => _notificationHandlerService.showNotification(),
            child: Text('Tampilkan Notifikasi'),
          ),
          ElevatedButton(
            onPressed:
                () => _notificationHandlerService.showNotification(
                  tipeNotifikasi: 'bigPicture',
                ),
            child: Text('Tampilkan Notifikasi big picture'),
          ),
        ],
      ),
    ),
    );
  }
}
