//
//  initialViewController.swift
//  tutorialUIPage
//
//  Created by Brian Shih on 7/15/16.
//  Copyright © 2016 BrianShih. All rights reserved.
//

import UIKit
import Foundation

class initialViewController: UIViewController {

    
    @IBOutlet weak var timeLabel: UILabel!
    
    var timer = NSTimer()
    var time = 0
    
    func increaseTimer() {
        time++
        timeLabel.text = "\(time)"
        
    }
    
    override func viewDidLoad() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "increaseTimer", userInfo: nil, repeats: true)
    }
    
    
    
    
    
//    var timer = NSTimer()
//    
//    var time = 0
//    
//    @IBOutlet var timerLabel: UILabel!
//    
//    func increaseTimer() {
//        
//        time++
//        
//        timerLabel.text = "\(time)"
//        
//    }
//    
//    @IBAction func play(sender: AnyObject) {
//        
//        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("increaseTimer"), userInfo: nil, repeats: true)
//        
//    }
//
    
}
