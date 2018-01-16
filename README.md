# VizAISDK

## Account Set-up

In the vizAI Dash, log in or create an account and navigate to the home page. Tap the plus on the top, right-hand corner to add a new app to your account. Follow the steps to register the application. Those steps are repeated below, but make sure to enter your application's bundle identifier and select a model to analyze.

## Installation

Our SDK is distributed through Cocoapods and requires version 1.4.0 or above. To install, simple add `pod 'VizAISDK'` to your project's Podfile.

## Configuration

In your project's AppDelegate, add the following line to configure the SDK:

```
import UIKit
import VizAISDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        VizAIApp.shared().configure(apiKey: <insert API key here>)
        return true
    }
```

## Upload Screenshots

While recording, we upload a key corresponding to the view controller that is currently presented to the user. On the back-end, we match this key to a screenshot that you upload. In order to upload screenshots, add the following to the view controllers you wish to match:

```
import VizAISDK

...

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
   
        VizAIApp.shared().activate_screenshots()
    }
```

Run your project in the Simulator or on device and a camera icon will appear in the top, right-hand corner of the view controllers where screenshots are activated. Simply tap on that icon and we'll have the screenshot!

To remove the screenshots overlay, call `VizAIAPP.shared().deactivate_screenshots()`.
