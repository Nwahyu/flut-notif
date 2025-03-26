import Flutter
import UIKit
import workmanager

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    WorkmanagerPlugin.setPluginRefistrantCallback {registry in GeneratedPluginRegistrant.register(with: registry)}

    WorkmanagerPlugin.registerBGProcessingTask(withIdentifier: "task-identifier")
    WorkmanagerPlugin.registerPeriodicTask(withIdentifier: "com.dicoding.notificationApp", requency: NSNumber(value: 16 * 16))

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

}
