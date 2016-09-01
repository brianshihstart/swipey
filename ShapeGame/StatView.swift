/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

let π = CGFloat(M_PI)

func DegreesToRadians (value:CGFloat) -> CGFloat {
    return value * π / 180.0
}

func RadiansToDegrees (value:CGFloat) -> CGFloat {
    return value * 180.0 / π
}

/*
 * Copyright (c) 2015 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

@IBDesignable
class StatView: UIView {
    
    var duration: CGFloat = 0
    
    let percentLabel = UILabel()
    
    
    var range: CGFloat = 10
    var curValue: CGFloat = 0 {
        didSet {
            animate()
        }
    }
    let margin: CGFloat = 10
    
    let bgLayer = CAShapeLayer()
    @IBInspectable var bgColor: UIColor = UIColor.blueColor() {
        didSet {
            configure()
        }
    }
    let fgLayer = CAShapeLayer()
    @IBInspectable var fgColor: UIColor = UIColor.greenColor() {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        configure()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
        configure()
    }
    
    func setup() {
        self.backgroundColor = UIColor.clearColor()
        // Setup background layer
        bgLayer.lineWidth = 20.0
        bgLayer.fillColor = nil
        bgLayer.strokeEnd = 1
        layer.addSublayer(bgLayer)
        fgLayer.lineWidth = 20.0
        fgLayer.fillColor = nil
        fgLayer.strokeEnd = 0
        layer.addSublayer(fgLayer)
        
        // Setup percent label
        percentLabel.font = UIFont.systemFontOfSize(26)
        percentLabel.textColor = UIColor.whiteColor()
        percentLabel.text = "0/0"
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(percentLabel)
        
        // Setup caption label
     
        
        // Setup constraints
        let percentLabelCenterX = percentLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor)
        let percentLabelCenterY = percentLabel.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor, constant: -margin)
        NSLayoutConstraint.activateConstraints([percentLabelCenterX, percentLabelCenterY])
        
          }
    
    func configure() {
        bgLayer.strokeColor = bgColor.CGColor
        fgLayer.strokeColor = fgColor.CGColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupShapeLayer(bgLayer)
        setupShapeLayer(fgLayer)
    }
    
    private func setupShapeLayer(shapeLayer:CAShapeLayer) {
        shapeLayer.frame = self.bounds
        let startAngle = DegreesToRadians(0)
        let endAngle = DegreesToRadians(360)
        let center = percentLabel.center
        let radius = CGRectGetWidth(self.bounds) * 0.35
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        shapeLayer.path = path.CGPath
        
    }
    
    private func animate() {
        
        print("animatingggggg")
        percentLabel.text = String(format: "%.0f/%.0f", curValue, range)
        
        var fromValue = fgLayer.strokeEnd
        print(fromValue)
        
        let toValue = curValue / range
        
        //    if let presentationLayer = fgLayer.presentationLayer() as? CAShapeLayer {
        //      fromValue = presentationLayer.strokeEnd
        //    }
        let percentChange = abs(fromValue - toValue)
        
        // 1
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        
        print("from: \(fromValue)")
        animation.toValue = 27
        print("to: \(toValue)")
        
        
        // 2
        animation.duration = CFTimeInterval(percentChange * 4)
        print("duration \(percentChange * 4)")
        
        // 3
        fgLayer.removeAnimationForKey("stroke")
        fgLayer.addAnimation(animation, forKey: "stroke")
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        fgLayer.strokeEnd = toValue
        CATransaction.commit()
    }
    
}