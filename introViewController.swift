//
//  introViewController.swift
//  ShapeGame
//
//  Created by Brian Shih on 7/16/16.
//  Copyright © 2016 Brian Shih. All rights reserved.
//

import UIKit
import Foundation

class introViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let ivc = segue.destinationViewController as? container {
            if let identifier = segue.identifier {
                switch identifier {
                case "toContainer":
                ivc.level = 1
                ivc.pages = 1
                default: break
                
                }
            
            
            }
        }
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if let ivc = segue.destinationViewController as? ImageViewController {
//            if let identifier = segue.identifier {
//                switch identifier {
//                case "Earth":
//                    ivc.imageURL = DemoURL.NASA.Earth
//                    ivc.title = "Earth"
//                case "Saturn":
//                    ivc.imageURL = DemoURL.NASA.Saturn
//                    ivc.title = "Saturn"
//                case "Cassini":
//                    ivc.imageURL = DemoURL.NASA.Cassini
//                    ivc.title = "Cassini"
//                default: break
//                }
//            }
//        }
//    }

    
    
    @IBAction func goToNextScene(sender: UIButton) {
        
        
        
        
        
    }
    
}
