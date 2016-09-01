//
//  container.swift
//  ShapeGame
//
//  Created by Brian Shih on 7/16/16.
//  Copyright © 2016 Brian Shih. All rights reserved.
//

import UIKit
import Foundation
import GameplayKit

class container: UIViewController {
    
    @IBOutlet weak var statView: StatView!
    @IBOutlet weak var timer: UILabel!
    
    
    var level: Int!
    var countdown = NSTimer()
    var time: Int = 0
    
    var pages: Int!
    var arrayOfColors: [shapeColorMovements] = []

    
    override func viewDidLoad() {
        print(arrayOfColors.count)
        
        time = level*5
        statView.range = CGFloat(10)
        statView.curValue = CGFloat(10)
        statView.duration = CGFloat(time)
        print("time: \(time)")
        timer.text = "\(time)"
        countdown = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "increaseTimer", userInfo: nil, repeats: true)
      
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let gameController = segue.destinationViewController as? GameViewController {
            if let identifier = segue.identifier {
                
                switch identifier {
                    case "toGame":
                        gameController.level = self.level
                        gameController.arrayOfColors = self.arrayOfColors
                    
                default: break
                }
            }
        }
        
        if let destination = segue.destinationViewController as? collectiveSwipe {
            if let identifier = segue.identifier {
                switch identifier {
                case "embed":
                    
                    print(pages)
                    
                    for i in 0 ... level - 1 {
                        let array = ["tap", "left", "right"]
                        let randomOrder = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(array)
                        
                        
                        arrayOfColors.append(shapeColorMovements(triangle: randomOrder[0] as! String, square: randomOrder[1] as! String, circle: randomOrder[2] as! String))
                        
                    }
                    print("hello")
                    print(arrayOfColors.count)
                    destination.pageCount = pages
                    destination.arrayOfColors = self.arrayOfColors
                
                default: break
                    
                }
            }
        }
    }
    
    
    func increaseTimer() {
        if time == 0 {
            performSegueWithIdentifier("toGame", sender: self)
        }
        time -= 1
        statView.percentLabel.text = "\(time)"
//        statView.curValue = statView.range - CGFloat(time)
        
    }
    

}
