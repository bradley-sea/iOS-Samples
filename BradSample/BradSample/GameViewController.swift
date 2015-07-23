//
//  GameViewController.swift
//  BradSample
//
//  Created by Bradley Johnson on 7/22/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let gameScene = GameScene(size: self.view.frame.size)
    
    if let sceneView = self.view as? SKView {
      
      sceneView.presentScene(gameScene)
    }
    
  }
}
