//
//  ViewController.swift
//  TapMe
//
//  Created by Dave on 01.10.2018.
//  Copyright © 2018 DaKar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    
    var timer = Timer()
    var timeInt = 10
    var coreInt = 0
    var gameInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGame(_ sender: Any) {
        
        if timeInt == 10 {
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startCounter), userInfo: nil, repeats: true)
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.5
        }
        if gameInt == 1 {
            
            coreInt += 1
            scoreLabel.text = String(coreInt)
        } else {
            timeInt = 10
            coreInt = 0
            
            timeLabel.text = String(timeInt)
            scoreLabel.text = String(coreInt)
            
            startGameButton.setTitle("Start", for: UIControlState.normal)
        }
    }
    
    @objc func startCounter() {
        timeInt -= 1
        timeLabel.text = String(timeInt)
        gameInt = 1
        startGameButton.isEnabled = true
        startGameButton.alpha = 1
        
        startGameButton.setTitle("TAP", for: UIControlState.normal)
        if timeInt == 0 {
            timer.invalidate()
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.5
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(restart), userInfo: nil, repeats: false)
            startGameButton.setTitle("Restart", for: UIControlState.normal)
        }
    }
    @objc func restart() {
        gameInt = 0
        startGameButton.isEnabled = true
        startGameButton.alpha = 1
    }
}

