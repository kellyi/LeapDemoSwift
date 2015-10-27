//
//  GameScene.swift
//  light
//
//  Created by Kelly Innes on 10/27/15.
//  Copyright (c) 2015 Kelly Innes. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let rightHand = SKSpriteNode(imageNamed: "righthand")
    let leftHand = SKSpriteNode(imageNamed: "lefthand")
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = SKColor.grayColor()
        rightHand.position = CGPoint(x: self.size.width/2 + 250, y: self.size.height/2)
        rightHand.xScale = 0.1
        rightHand.yScale = 0.1
        leftHand.xScale = 0.1
        leftHand.yScale = 0.1
        leftHand.position = CGPoint(x: self.size.width/2 - 250, y: self.size.height/2)
        addChild(rightHand)
        addChild(leftHand)
    }
        
    override func update(currentTime: CFTimeInterval) {
        updateHandPositions()
    }
    
    func updateHandPositions() {
        let newRightHandPosition = Example.sharedInstance.rightHandPosition as LeapVector
        var newRightHandX = newRightHandPosition.x
        var newRightHandY = newRightHandPosition.y
        if newRightHandX > 225.0 {
            newRightHandX = 225.0
        } else if newRightHandX < -225.0 {
            newRightHandX = -225.0
        }
        if newRightHandY < 100.0 {
            newRightHandY = 100.0
        } else if newRightHandY > 500.0 {
            newRightHandY = 500.0
        }
        rightHand.position = CGPoint(x: self.size.width/2 + CGFloat(newRightHandX), y: self.size.height/2 + CGFloat(newRightHandY/2))
        
        let newLeftHandPosition = Example.sharedInstance.leftHandPosition as LeapVector
        var newLeftHandX = newLeftHandPosition.x
        var newLeftHandY = newLeftHandPosition.y
        if newLeftHandX > 225.0 {
            newLeftHandX = 225.0
        } else if newLeftHandX < -225.0 {
            newLeftHandX = -225.0
        }
        if newLeftHandY < 100.0 {
            newLeftHandY = 100.0
        } else if newLeftHandY > 500.0 {
            newLeftHandY = 500.0
        }
        leftHand.position = CGPoint(x: self.size.width/2 + CGFloat(newLeftHandX), y: self.size.height/2 + CGFloat(newLeftHandY/2))
        
    }
}
