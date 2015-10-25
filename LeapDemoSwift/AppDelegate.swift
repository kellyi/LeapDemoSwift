//
//  AppDelegate.swift
//  LeapDemoSwift
//
//  Created by Kelly Innes on 10/24/15.
//  Copyright © 2015 Kelly Innes. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        let example = Example()
        example.run()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

}

