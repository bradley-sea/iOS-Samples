//
//  SamViewController.swift
//  BradSample
//
//  Created by Bradley Johnson on 7/22/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

import UIKit

class SamViewController: UIViewController {

  @IBOutlet weak var samImageView: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      samImageView.clipsToBounds = true
      samImageView.layer.borderColor = UIColor.purpleColor().CGColor
    }
  
  @IBAction func bottomSliderChanged(sender: UISlider) {
    
    let radians = CGFloat(360 * sender.value) * CGFloat(M_PI) / 180.0
    samImageView.layer.transform = CATransform3DMakeRotation(radians, 0.0, 0.0, 1.0)
  
  }
  
  @IBAction func cornerRadiusChanged(sender: UISlider) {
    
        samImageView.layer.cornerRadius = samImageView.frame.size.width * CGFloat(sender.value)
    
  }
  @IBAction func borderChanged(sender: UISlider) {
    
    samImageView.layer.borderWidth = CGFloat(10.0 * sender.value)
    
  }

}
