LeapDemoSwift
=============

An OS X app in Swift to demonstrate using the Leap Motion Objective-C SDK.

Using the SDK with Swift requires [setting up a project using the instructions on the Leap Motion Developer Portal](https://developer.leapmotion.com/documentation/objc/devguide/Project_Setup.html) and creating a [bridging header file](https://github.com/kellyi/LeapDemoSwift/blob/master/LeapDemoSwift/LeapDemoSwift-Bridging-Header.h) to expose the classes to Swift.

After setting it up you can use the [Leap Motion SDK classes](https://developer.leapmotion.com/documentation/objc/api/Leap_Classes.html) as you'd use any other class in Swift. This project uses a [LeapMotionManager class](https://github.com/kellyi/LeapDemoSwift/blob/master/LeapDemoSwift/LeapMotionManager.swift) as a singleton to handle tracking hand motions et cetera.

Here's a current screenshot just to show it working:

![handsimage](https://github.com/kellyi/LeapDemoSwift/blob/master/hands.gif)

Both the [left hand image](https://openclipart.org/detail/167378/raised-hand-in-silhouette) and the [right hand image](https://openclipart.org/detail/167377/raised-hand-in-silhouette) are from [Openclipart.org](https://openclipart.org/). The [ball image](https://openclipart.org/detail/22102/tennis-ball) is also from Openclipart.org.
