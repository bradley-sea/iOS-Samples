//
//  GameScene.swift
//  BradSample
//
//  Created by Bradley Johnson on 7/22/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  
  let circleRadius : CGFloat = 10.0
  let horizontalSpace = 25
  let verticalSpace = 20
  let obstacleRadius : CGFloat = 15
  let obstacleLength = 25
  
  override func didMoveToView(view: SKView) {
    
    self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
    setupBoard()
  }
  
  
  override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    
    for touch in (touches as! Set<UITouch>) {
      
      let circle = SKShapeNode(circleOfRadius: circleRadius)
      circle.fillColor = UIColor.blueColor()
      circle.strokeColor = UIColor.clearColor()
      
      let location = touch.locationInNode(self)
      circle.position = location
      
      self.addChild(circle)
      
      circle.physicsBody = SKPhysicsBody(circleOfRadius: circleRadius)
      
    }
  }
  
  func setupBoard() {
    
    let numberOfColumns = Int(self.size.width) / (Int(obstacleRadius) * 2 + horizontalSpace)
    let numberOfRows = Int(self.size.height) / (Int(obstacleRadius) * 2 + verticalSpace)
    
    for i in 0...numberOfRows - 1 {
      
      for n in 0...numberOfColumns {
        
        let obstacle = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: obstacleLength, height: obstacleLength))
        
        let buffer : Int
        
        if i % 2 == 0 {
          buffer = 20
        } else {
          buffer = 30
        }
        
        let x = n * Int(obstacleRadius) * 2 + (horizontalSpace * n) + buffer
        let y = i * Int(obstacleRadius) * 2 + (verticalSpace * i)
        obstacle.position = CGPoint(x: x, y: y)
        
        obstacle.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 20, height: 20))
        obstacle.physicsBody?.affectedByGravity = false
        obstacle.physicsBody?.dynamic = false
        
        let rotation = SKAction.rotateByAngle(CGFloat(45 * M_PI / 180), duration: 0.0)
        obstacle.runAction(rotation)
        
        self.addChild(obstacle)
      }
      
    }
    
  }
  
  
   
}
