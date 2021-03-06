# VizAISDK

[![Version](https://img.shields.io/cocoapods/v/VizAISDK.svg?style=flat)](http://cocoapods.org/pods/VizAISDK)
[![License](https://img.shields.io/cocoapods/l/VizAISDK.svg?style=flat)](http://cocoapods.org/pods/VizAISDK)
[![Platform](https://img.shields.io/cocoapods/p/VizAISDK.svg?style=flat)](http://cocoapods.org/pods/VizAISDK)

## Account Set-up

In the vizAI Dash, log in or create an account and navigate to the home page. Tap the plus on the top, right-hand corner to add a new app to your account. Follow the steps to register the application. Those steps are repeated below, but make sure to enter your application's bundle identifier and select a model to analyze.

### Finding Bundle Identifier

If you're using XCode, then you can find your project's bundle identifier by clicking on the project and opening the General tab:

![Alt Text](https://github.com/vizaiapp/VizAISDKRepo/blob/master/READMEResources/FindBundleIdentifier.gif)

### Adding the App

Now that you have the bundle id, add the app and select what models you want to run:

<div style="text-align:center;"><img src="https://github.com/vizaiapp/VizAISDKRepo/blob/master/READMEResources/appvideo.gif" width="200" height="355" align="middle"/></div>


## Installation

Our SDK is distributed through Cocoapods and requires version 1.4.0 or above. The minimum iOS target is version 11.2. **NOTE**: We use Firebase for our backend so a pod install will install Firebase if it's not already available. Upon starting the application, there may be print statements from Firebase but that is just the VizAISDK.

![alt text][list] Add `pod 'VizAISDK'` to your Podfile.

![alt text][build] Run `pod install` from the command-line.

## Configuration

In your project's AppDelegate, add the following line to configure the SDK:

<pre>
import UIKit
<b>import VizAISDK</b>

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        <b>VizAIApp.shared().configure(apiKey: "put your API key here")</b>
        return true
    }
</pre>

## Upload Screenshots

### Manual Upload

While recording, we upload a key corresponding to the view controller that is currently presented to the user. On the back-end, we match this key to a screenshot that you upload. In order to upload screenshots, add the following to the view controllers you wish to match:

<pre>
<b>import VizAISDK</b>

...

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
   
        <b>VizAIApp.shared().overlayScreenshotButton()</b>
    }
</pre>

Run your project in the Simulator or on device and a camera icon will appear in the top, right-hand corner of the view controllers where screenshots are activated. Simply tap on that icon and we'll have the screenshot!

To remove the screenshots overlay, call `VizAIApp.shared().removeScreenshotButton()`.

### Automatic Upload

To automatically upload screenshots, add the following to the view controller you want to start uploading in:

<pre>
<b>import VizAISDK</b>

...

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
   
        <b>VizAIApp.shared().activateScreenshots()</b>
    }
</pre>

Every second, it will check to see if the view controller changed and, if it did, it will upload a screenshot for that new view controller. To deactivate this mode, call `VizAIApp.shared().deactivateScreenshots()`.

## Recording Sessions

Recording sessions will run the models downloaded on the user's device and submit the results to Firebase for our analytics app to display. For now, each API key is limited to *100 sessions* and each session is limited to *5 minutes*.

### Start Recording

Once your SDK is configured and the app is added in the Dash, we can start a recording session. Anywhere in your code, simply add `VizAIApp.shared().startRecording(sessionName: "Insert Session Name")` where you want it to start. The session name is optional, but it helps identify what process you're trying to observe. For example, we record during account creations and so we use `VizAIApp.shared().startRecording(sessionName: "Account Creation")`.

You can have multiple calls to `startRecording`. The first call will start the camera recording, and the subsequent calls will simply update the session name.


### End Recording

To end the recording, add `VizAIApp.shared().stopRecording()`. Make sure to add the call to stop recording, otherwise certain aggregate statistics will be unavailable!

## Example Project

In this repo, we have an example project called SignUpExample. There, we have a simple sign-up process (it doesn't actually upload any info) to show how the service might be used. However, the sign-up process isn't very user-friendly! If you run the code, you'll see what we mean. And if you run it with the SDK, you can see the results of your session in the Dash!

[build]: https://github.com/vizaiapp/VizAISDKRepo/blob/master/READMEResources/ic_build.png
[account]: https://github.com/vizaiapp/VizAISDKRepo/blob/master/READMEResources/ic_account_box.png
[assessment]: https://github.com/vizaiapp/VizAISDKRepo/blob/master/READMEResources/ic_assessment.png
[assignment]: https://github.com/vizaiapp/VizAISDKRepo/blob/master/READMEResources/ic_assignment.png
[code]: https://github.com/vizaiapp/VizAISDKRepo/blob/master/READMEResources/ic_code.png
[description]: https://github.com/vizaiapp/VizAISDKRepo/blob/master/READMEResources/ic_description.png
[iphone]: https://github.com/vizaiapp/VizAISDKRepo/blob/master/READMEResources/ic_phone_iphone.png
[list]: https://github.com/vizaiapp/VizAISDKRepo/blob/master/READMEResources/ic_view_list.png
