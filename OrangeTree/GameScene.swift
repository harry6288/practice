//
//  GameScene.swift
//  OrangeTree
//
//  Created by hardeep kaur on 2019-06-10.
//  Copyright © 2019 hardeep kaur. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
     var oranges:[SKSpriteNode] = []
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        
        }
    func makeOrange(xPosition:CGFloat, yPosition:CGFloat) {
        // lets add some cats
        let orange = SKSpriteNode(imageNamed: "Orange")
        
        // set the position of the orange
        orange.position = CGPoint(x:xPosition, y:yPosition)
        orange.zPosition = 100
        
        // add physics to the orange
        // -------------------------
        
        // 1. create a circular hitbox around the orange
        orange.physicsBody = SKPhysicsBody(circleOfRadius: orange.size.width / 2)
        // By default, a physics body has:
        // -- dynamic = true (show collisions)
        // -- affectedByGravity = true;
        
        
        // add the orange to the scene
        addChild(orange)
        
        // add the oragne to the oranges array
        self.oranges.append(orange)
        
        print("Where is orange? \(xPosition), \(yPosition)")
    }
        // Create shape node to use during mouse interaction
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // detect when you touch the tree
        let locationTouched = touches.first
        
        if (locationTouched == nil) {
            // This is error handling
            // Sometimes the mouse detection doesn't work properly
            // and IOS can't get the position.
            return
        }
        
        let mousePosition = locationTouched!.location(in:self)
        
        print("MOUSE X?  \(mousePosition.x)")
        print("MOUSE Y?  \(mousePosition.y)")
        print("------")
        
        

    // 1. Detect what sprite the person touched
    let spriteTouched = self.atPoint(mousePosition)
    //print("YOU TOUCHED: \(spriteTouched)")
    
    // 2. Check if he touched the tree
    if (spriteTouched.name == "tree") {
    print("TREE TOUCHED!")
         makeOrange(xPosition: mousePosition.x, yPosition: mousePosition.y)
    }
        
    
}
}
