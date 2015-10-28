//
//  LeapMotionManager.swift
//  LeapDemoSwift
//
//  Created by Kelly Innes on 10/24/15.
//  Copyright © 2015 Kelly Innes. All rights reserved.
//

import Foundation

class LeapMotionManager: NSObject, LeapDelegate {
    
    static let sharedInstance = LeapMotionManager()
    
    let controller = LeapController()
    var rightHandPosition = LeapVector()
    var leftHandPosition = LeapVector()
    
    func run() {
        controller.addDelegate(self)
        print("running")
    }
    
    // MARK: - LeapDelegate Methods
    
    func onInit(controller: LeapController!) {
        print("initialized")
    }
    
    func onConnect(controller: LeapController!) {
        print("connected")
        controller.enableGesture(LEAP_GESTURE_TYPE_CIRCLE, enable: true)
        controller.enableGesture(LEAP_GESTURE_TYPE_KEY_TAP, enable: true)
        controller.enableGesture(LEAP_GESTURE_TYPE_SCREEN_TAP, enable: true)
        controller.enableGesture(LEAP_GESTURE_TYPE_SWIPE, enable: true)
    }
    
    func onDisconnect(controller: LeapController!) {
        print("disconnected")
    }
    
    func onServiceConnect(controller: LeapController!) {
        print("service disconnected")
    }
    
    func onDeviceChange(controller: LeapController!) {
        print("device changed")
    }
    
    func onExit(controller: LeapController!) {
        print("exited")
    }
    
    func onFrame(controller: LeapController!) {
        let currentFrame = controller.frame(0) as LeapFrame
        let hands = currentFrame.hands as! [LeapHand]
        for hand in hands {
            if hand.isLeft {
                leftHandPosition = hand.palmPosition
                print("left hand position: \(leftHandPosition)")
            } else if hand.isRight {
                rightHandPosition = hand.palmPosition
                print("right hand position: \(rightHandPosition)")
            }
        }
    }
    
    func onFocusGained(controller: LeapController!) {
        print("focus gained")
    }
    
    func onFocusLost(controller: LeapController!) {
        print("focus lost")
    }
    
}