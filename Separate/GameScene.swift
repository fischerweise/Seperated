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
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let maximumPossibleForce = touch.maximumPossibleForce
            let force = touch.force
            let normalizedForce = force/maximumPossibleForce
            player.position.x = (self.size.width / 2) - normalizedForce * (self.size.width / 2 - 25)
            player.position.x = (self.size.width / 2) + normalizedForce * (self.size.width / 2 - 25)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        resetPlayerPosition()
    }
    func resetPlayerPosition() {
        player.position = initialPlayerPosition
        player2.position = initialPlayerPosition
    }
    
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        addPlayer()
        addRow(type: RowTypes.twoS)
    }
    
    func addRandomRow() {
        let randomNumber = Int(arc4random_uniform(6))
        switch randomNumber {
        case 0:
            addRow(type: RowTypes(rawValue: 0)!)
            break
        case 1:
            addRow(type: RowTypes(rawValue: 1)!)
            break
        case 2:
            addRow(type: RowTypes(rawValue: 2)!)
            break
        case 3:
            addRow(type: RowTypes(rawValue: 3)!)
            break
        case 4:
            addRow(type: RowTypes(rawValue: 4)!)
            break
        case 5:
            addRow(type: RowTypes(rawValue: 5)!)
            break
        default:
            break
        }
    }
    
    var lastUptadeTimeInterval = TimeInterval()
    var lastYieldTimeInterval = TimeInterval()
    
    func updateTimeSinceLastUpdate(timeSinceLastUpdate: CFTimeInterval) {
        lastYieldTimeInterval += timeSinceLastUpdate
        if lastYieldTimeInterval > 0.6 {
            lastYieldTimeInterval = 0
            addRandomRow()
        }
    }
    override func update(_ currentTime: TimeInterval) {
        var timeSinceLastUpdate = currentTime - lastUptadeTimeInterval
        lastUptadeTimeInterval = currentTime
        if timeSinceLastUpdate > 1 {
            timeSinceLastUpdate = 1/60
            lastUptadeTimeInterval = currentTime
        }
        updateTimeSinceLastUpdate(timeSinceLastUpdate: timeSinceLastUpdate)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "Player" {
            print("Game Over")
            showGameOver()
        }
    }
    
    func showGameOver() {
        let transition = SKTransition.fade(withDuration: 0.5)
        let gameOverScene = GameOverScene(size: self.size)
        self.view?.presentScene(gameOverScene, transition: transition)
    }

}
