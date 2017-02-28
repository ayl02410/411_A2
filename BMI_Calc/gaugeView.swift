//
//  gaugeView.swift
//  BMI_Calc
//
//  Alex Liao
//  Taken from example by https://www.raywenderlich.com/90690/modern-core-graphics-with-swift-part-1
//

import UIKit

let ranges = 90
let π: CGFloat = CGFloat(M_PI)

@IBDesignable class gaugeView: UIView {
    
    var base: Int = 16 
    @IBInspectable var outlineColor: UIColor = UIColor.darkGray
    @IBInspectable var gaugeColor: UIColor = UIColor.clear
    @IBInspectable var underWeightColor: UIColor = UIColor.orange
    @IBInspectable var normalWeightColor: UIColor = UIColor.cyan
    @IBInspectable var overWeightColor: UIColor = UIColor.magenta
    @IBInspectable var obeseWeightColor: UIColor = UIColor.red

    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius: CGFloat = max(bounds.width, bounds.height)
        let arc_width: CGFloat = 50
        let startAngle: CGFloat = 3 * π / 4
        let endAngle: CGFloat = π / 4
        let path = UIBezierPath(arcCenter: center,
                                radius: radius/2 - arc_width/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        path.lineWidth = arc_width
        gaugeColor.setStroke()
        //underWeightColor.setStroke()
        //normalWeightColor.setStroke()
        //overWeightColor.setStroke()
        //obeseWeightColor.setStroke()
        path.stroke()
        
        let angleDifference: CGFloat = 2 * π - startAngle + endAngle
        let arcLengthPerIncrement = angleDifference / CGFloat(ranges)
        let outlineEndAngle = arcLengthPerIncrement * CGFloat(base) + startAngle
        let outlinePath = UIBezierPath(arcCenter: center,
                                       radius: bounds.width/2 - 2.5,
                                       startAngle: startAngle,
                                       endAngle: outlineEndAngle,
                                       clockwise: true)
        outlinePath.addArc(withCenter: center,
                                     radius: bounds.width/2 - arc_width + 2.5,
                                     startAngle: outlineEndAngle,
                                     endAngle: startAngle,
                                     clockwise: false)
        outlinePath.close()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
    }
}
