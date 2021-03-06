import UIKit
import Flutter
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/battery",
                                              binaryMessenger: controller.binaryMessenger)
    batteryChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // Note: this method is invoked on the UI thread.
      // Handle battery messages.
    })

    GeneratedPluginRegistrant.register(with: self)
    batteryChannel.setMethodCallHandler({
  [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
  // Note: this method is invoked on the UI thread.
  guard call.method == "runModel" else {
    result(FlutterMethodNotImplemented)
    return
  }
//        call.method.
        
        guard let args = call.arguments else {
            result("iOS could not recognize flutter arguments in method")
        }
        
        var urlString = args["path"] as! String
        print("* Urlstring: \(urlString)")
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
let userDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
let paths             = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
if let dirPath        = paths.first
{
   let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(urlString)
   let image    = UIImage(contentsOfFile: imageURL.path)
   // Do whatever you want with the image
}
//  self?.receiveBatteryLevel(result: result)
})
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    private func receiveBatteryLevel(result: String) {
  guard let manifestPath = Bundle.main.path(
    forResource: "manifest",
    ofType: "json",
    inDirectory: "ml"
) else { return true }
let localModel = AutoMLLocalModel(manifestPath: manifestPath)
        
//        var im = UIImage(named: )
        
}
    
}



/*private func receiveBatteryLevel(result: FlutterResult) {
  let device = UIDevice.current
  device.isBatteryMonitoringEnabled = true
  if device.batteryState == UIDevice.BatteryState.unknown {
    result(FlutterError(code: "UNAVAILABLE",
                        message: "Battery info unavailable",
                        details: nil))
  } else {
    result(Int(device.batteryLevel * 100))
  }
}*/



// https://firebase.google.com/docs/ml-kit/ios/label-images-with-automl#configure-a-local-model-source
// https://flutter.dev/docs/development/platform-integration/platform-channels?tab=ios-channel-swift-tab#step-4-add-an-ios-platform-specific-implementation
