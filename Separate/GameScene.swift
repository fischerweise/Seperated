//
//  GameScene.swift
//  Separate
//
//  Created by Mustafa Pekdemir on 5.06.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player: SKSpriteNode!
    var player2: SKSpriteNode!
    var initialPlayerPosition: CGPoint!
    
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        addPlayer()
        addRow(type: RowTypes.oneS)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
