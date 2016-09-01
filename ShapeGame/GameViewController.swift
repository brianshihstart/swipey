import UIKit
import SpriteKit

class GameViewController: UIViewController {
    // test
    var level: Int!
    var arrayOfColors: [shapeColorMovements]!

    override func viewDidLoad() {
        print(level)
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .ResizeFill
        scene.viewController = self
        scene.level = UInt32(self.level)
        scene.arrayOfColors = self.arrayOfColors
        skView.presentScene(scene)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destination = segue.destinationViewController as? container {
            if let identifier = segue.identifier {
                switch identifier {
                    case "backToContainer":
                        destination.level = self.level + 1
                        destination.pages = self.level + 1
                    
                default: break
                }
                
            }
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}