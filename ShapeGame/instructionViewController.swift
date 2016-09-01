//
//  instructionViewController.swift
//  ShapeGame
//
//  Created by Brian Shih on 7/18/16.
//  Copyright © 2016 Brian Shih. All rights reserved.
//

import UIKit
import Foundation

class instructionViewController: UIViewController {
    
    var page = 0
    var triangleMoveString: String!
    var squareMoveString: String!
    var circleMoveString: String!
    
    @IBOutlet weak var triangleImageView: UIImageView!
    
    @IBOutlet weak var squareImageView: UIImageView!
    
    @IBOutlet weak var circleImageView: UIImageView!
    
    
    @IBOutlet weak var triangleMovement: UILabel!
    
    @IBOutlet weak var squareMovement: UILabel!
    
    @IBOutlet weak var circleMovement: UILabel!
    
    
    override func viewDidLoad() {
        
        triangleMovement.text = triangleMoveString
        squareMovement.text = squareMoveString
        circleMovement.text = circleMoveString
        
        triangleImageView.image = UIImage(named: "\(page + 1)triangle")
        squareImageView.image = UIImage(named: "\(page + 1)square")
        circleImageView.image = UIImage(named: "\(page + 1)circle")
        
        
        
    }

    
}
