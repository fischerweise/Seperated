//
//  GameViewController.swift
//  Separate
//
//  Created by Mustafa Pekdemir on 5.06.2022.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
    
    var backgroundMusic = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: CGSize(width: 1536, height: 2048))
        
        let backMusicURL = Bundle.main.url(forResource: "backgroundMusic", withExtension: "mp3")
        do {
            try backgroundMusic = AVAudioPlayer(contentsOf: backMusicURL!)
        } catch {
            print("cant play music")
        }
        backgroundMusic.numberOfLoops = -1
        backgroundMusic.prepareToPlay()
        backgroundMusic.play()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
