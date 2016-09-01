//
//  Shape.swift
//  ShapeGame
//
//  Created by ERIC on 10/10/15.
//  Copyright © 2015 Eric Hu. All rights reserved.
//

import UIKit
import SpriteKit

class Shape: SKSpriteNode {
    

    var typeOfShape: ShapeType
    var movement:String
    var tap:Bool = false
    var left:Bool = false
    var right:Bool = false
    var colorForm: Int
    
    init(type: ShapeType, movement:String, color: Int)
    {
        //let shape = SKSpriteNode(imageNamed: name)
        self.typeOfShape = type
        self.movement = movement
        self.colorForm = color
        
//        let texture = SKTexture(imageNamed: type.rawValue)
        let texture = SKTexture(imageNamed: "\(color)\(typeOfShape.rawValue)")
        super.init(texture:texture, color: UIColor.clearColor(), size: texture.size())
     
        switch movement
        {
        case "tap":
            self.tap = true
        case "left":
            self.left = true
        case "right":
            self.right = true
        default:
            break
            
        }
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    

