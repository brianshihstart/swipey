//
//  tutorialPage.swift
//  tutorialUIPage
//
//  Created by Brian Shih on 7/15/16.
//  Copyright © 2016 BrianShih. All rights reserved.
//

import UIKit
import Foundation

class tutorialPage: UIViewController {
    //lol
    
    var page = 0
    var triangleMovement: String!
    var squareMovement: String!
    var circleMovement: String!
    
    override func viewDidLoad() {
        triangleLabel.text = "triangle: \(triangleMovement)"
        squareLabel.text = "square: \(squareMovement)"
        circleLabel.text = "circle: \(circleMovement)"

        
    }
    
    @IBOutlet weak var triangleLabel: UILabel!
    
    @IBOutlet weak var squareLabel: UILabel!

    @IBOutlet weak var circleLabel: UILabel!
}
