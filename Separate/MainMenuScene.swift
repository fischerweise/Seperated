//
//  MainMenuScene.swift
//  Separate
//
//  Created by Mustafa Pekdemir on 5.06.2022.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = SKColor.black
        let message = "START GAME"
        let label = SKLabelNode(fontNamed: "Optima-ExtraBlack")
        label.text = message
        label.fontColor = SKColor.cyan
        label.fontSize = 75
        label.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.3)
        addChild(label)
        
        let welcomeMessage = "WELCOME"
        let welcomeLabel = SKLabelNode(fontNamed: "Optima-ExtraBlack")
        welcomeLabel.text = welcomeMessage
        welcomeLabel.fontColor = SKColor.orange
        welcomeLabel.fontSize = 100
        welcomeLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.78)
        addChild(welcomeLabel)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let transition = SKTransition.fade(withDuration: 0.5)
        let gameScene = GameScene(size: self.size)
        self.view?.presentScene(gameScene, transition: transition)
    }
}
