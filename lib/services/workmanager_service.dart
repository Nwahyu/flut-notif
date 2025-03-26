import 'dart:math';

import 'package:myapp/services/http_dart.dart';
import 'package:myapp/static/my_workmanager.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackdispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // return Future.value(true);
    if (task == MyWorkmanager.oneOff.taskName ||
        task == MyWorkmanager.oneOff.uniqueName ||
        task == Workmanager.iOSBackgroundTask) {
      print("input data $inputData");
    } else if (task == MyWorkmanager.periodic.taskName) {
      int randomNumber = Random().nextInt(100);
      final httpService = HttpService();
      final result = await httpService.getDataFromUrl();
    }
  });
}

class WorkmanagerService {
  final Workmanager _workmanager;

  WorkmanagerService([Workmanager? workmanager])
    : _workmanager = workmanager ??= Workmanager();

  Future<void> init() async {
    await _workmanager.initialize(callbackdispatcher, isInDebugMode: true);
  }

  Future<void> runOneOffTask() async {
    await _workmanager.registerOneOffTask(
      MyWorkmanager.oneOff.uniqueName,
      MyWorkmanager.oneOff.taskName,
      constraints: Constraints(networkType: NetworkType.connected),
      initialDelay: const Duration(seconds: 5),
      inputData: {"data": "this payload data"},
    );
  }

  Future<void> runPeriodicTask() async {
    await _workmanager.registerPeriodicTask(
      MyWorkmanager.periodic.uniqueName,
      MyWorkmanager.periodic.taskName,
      frequency: const Duration(minutes: 16),
      initialDelay: Duration.zero,
      inputData: {"data": "this payload data"},
    );
  }

  Future<void> cancelAllTask() async {
    await _workmanager.cancelAll();
  }
}
