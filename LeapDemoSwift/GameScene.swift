//
//  GameScene.swift
//  LeapDemoSwift
//
//  Created by Kelly Innes on 10/27/15.
//  Copyright (c) 2015 Kelly Innes. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let rightHand = SKSpriteNode(imageNamed: "righthand")
    let leftHand = SKSpriteNode(imageNamed: "lefthand")
    let ball = SKSpriteNode(imageNamed: "ball")
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.gray
        //rightHand.position = CGPoint(x: (self.size.width/2) + 500, y: self.size.height/2)
        rightHand.xScale = 0.1
        rightHand.yScale = 0.1
        rightHand.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: rightHand.size.width, height: rightHand.size.height))
        rightHand.physicsBody?.collisionBitMask = 0
        rightHand.physicsBody?.categoryBitMask = 1
        rightHand.physicsBody?.contactTestBitMask = 1
        
        leftHand.xScale = 0.1
        leftHand.yScale = 0.1
        //leftHand.position = CGPoint(x: (self.size.width/2) - 500, y: self.size.height/2)
        leftHand.physicsBody?.collisionBitMask = 0
        leftHand.physicsBody?.categoryBitMask = 1
        leftHand.physicsBody?.contactTestBitMask = 1
        
        ball.xScale = 0.1
        ball.yScale = 0.1
        ball.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        ball.physicsBody?.categoryBitMask = 0
        ball.physicsBody?.collisionBitMask = 1
        ball.physicsBody?.contactTestBitMask = 1
        ball.physicsBody?.affectedByGravity = false
        addChild(rightHand)
        addChild(leftHand)
        addChild(ball)
    }
        
    override func update(_ currentTime: TimeInterval) {
        updateHandPositions()
    }
    
    func updateHandPositions() {
        let newRightHandPosition = LeapMotionManager.sharedInstance.rightHandPosition as LeapVector
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
        
        let newLeftHandPosition = LeapMotionManager.sharedInstance.leftHandPosition as LeapVector
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
