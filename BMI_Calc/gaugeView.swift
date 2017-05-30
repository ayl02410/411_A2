//
//  GaugeView.swift
//  BMI_Calc
//
//  Alex Liao
//  Taken from example by https://www.raywenderlich.com/90690/modern-core-graphics-with-swift-part-1
//

import UIKit


//MARK: Extension
extension UIColor{
    func setHexColor(_ hex: Int) -> UIColor {
        let _red: CGFloat = CGFloat((hex >> 16) & 0xFF) / 255.0
        let _green: CGFloat = CGFloat((hex >> 8) & 0xFF) / 255.0
        let _blue: CGFloat = CGFloat(hex & 0xFF) / 255.0
        
        let color = UIColor(red: _red, green: _green, blue: _blue, alpha: 1.0)
        return color
    }
} // End of Extension


let ranges = 50
let π: CGFloat = CGFloat(Double.pi)

@IBDesignable class GaugeView: UIView {
    
    static let shared = GaugeView()
    
    @IBInspectable var counter: Int = 0 {
        didSet {
            if counter <= ranges {
                setNeedsDisplay()
            }
        }
    }
    
    @IBInspectable var outlineColor: UIColor = UIColor.red
    @IBInspectable var gaugeColor: UIColor = UIColor.clear
    //@IBInspectable var underWeightColor: UIColor = UIColor.orange
    //@IBInspectable var normalWeightColor: UIColor = UIColor.cyan
    //@IBInspectable var overWeightColor: UIColor = UIColor.magenta
    //@IBInspectable var obeseWeightColor: UIColor = UIColor.red
 
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
        let outlineEndAngle = arcLengthPerIncrement * CGFloat(counter) + startAngle
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
        
        switch Double(counter)
        {
        
        case 0..<16:
            outlineColor = UIColor().setHexColor(0xC90000)
        case 16.0..<17:
            outlineColor = UIColor().setHexColor(0xD6460B)
        case 17..<18.50:
            outlineColor = UIColor().setHexColor(0xFDE300)
        case 18.50..<25:
            outlineColor = UIColor().setHexColor(0x85E800)
        case 25..<30:
            outlineColor = UIColor().setHexColor(0xCFC800)
        case 30..<35:
            outlineColor = UIColor().setHexColor(0xE37F00)
        case 35..<40:
            outlineColor = UIColor().setHexColor(0xE37F00)
        default:
            outlineColor = UIColor().setHexColor(0x670000)
        }
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
        outlineColor.setFill()
        outlinePath.fill()
    }
}





