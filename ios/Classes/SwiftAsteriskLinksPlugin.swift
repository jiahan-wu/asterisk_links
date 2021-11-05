import Flutter
import UIKit

public class SwiftAsteriskLinksPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "asterisk_links", binaryMessenger: registrar.messenger())
        let instance = SwiftAsteriskLinksPlugin()
        registrar.addApplicationDelegate(instance)
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    private var webpageURLString: String?
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(webpageURLString)
    }
    
    public func application(_ application: UIApplication,
                            continue userActivity: NSUserActivity,
                            restorationHandler: @escaping ([Any]) -> Void) -> Bool
    {
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
              let incomingURL = userActivity.webpageURL else {
                  return false
              }
        
        webpageURLString = incomingURL.absoluteString
        
        return true
    }
    
}
