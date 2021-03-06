//
//  StyleKit.swift
//  BinauralAudio
//
//  Created by Aurelius Prochazka on 4/16/15.
//  Copyright (c) 2015 AudioKit. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

import UIKit

class StyleKit: NSObject {
    
    class func drawHeadAndSpeakerWithAzimuth(_ azimuth: CGFloat) {
        
        
        
        // General Declarations
        let context: CGContext = UIGraphicsGetCurrentContext()!
        let PI : Float = 3.14159265359
        // Bezier Drawing
        let bezierPath: UIBezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 164, y: 103.01))
        bezierPath.addCurve(to: CGPoint(x: 174.16, y: 120.63), controlPoint1: CGPoint(x: 163.99, y: 103), controlPoint2: CGPoint(x: 168.76, y: 111.27))
        bezierPath.addCurve(to: CGPoint(x: 195.71, y: 133.73), controlPoint1: CGPoint(x: 182.06, y: 122.63), controlPoint2: CGPoint(x: 189.56, y: 127))
        bezierPath.addCurve(to: CGPoint(x: 207.77, y: 179.17), controlPoint1: CGPoint(x: 206.99, y: 146.06), controlPoint2: CGPoint(x: 211.01, y: 163.32))
        bezierPath.addCurve(to: CGPoint(x: 214.5, y: 190.92), controlPoint1: CGPoint(x: 211.6, y: 185.86), controlPoint2: CGPoint(x: 214.5, y: 190.92))
        bezierPath.addCurve(to: CGPoint(x: 203.87, y: 190.94), controlPoint1: CGPoint(x: 214.5, y: 190.92), controlPoint2: CGPoint(x: 210.09, y: 190.93))
        bezierPath.addCurve(to: CGPoint(x: 195.71, y: 203.13),controlPoint1: CGPoint(x: 201.8, y: 195.33), controlPoint2: CGPoint(x: 199.08, y: 199.45))
        bezierPath.addCurve(to: CGPoint(x: 132.27, y: 203.13), controlPoint1: CGPoint(x: 178.19, y: 222.29), controlPoint2: CGPoint(x: 149.79, y: 222.29))
        bezierPath.addCurve(to: CGPoint(x: 124.11, y: 190.94), controlPoint1: CGPoint(x: 128.9, y: 199.45), controlPoint2: CGPoint(x: 126.19, y: 195.33))
        bezierPath.addCurve(to: CGPoint(x: 113.48, y: 190.92), controlPoint1: CGPoint(x: 117.9, y: 190.93), controlPoint2: CGPoint(x: 113.48, y: 190.92))
        bezierPath.addCurve(to: CGPoint(x: 120.21, y: 179.17), controlPoint1: CGPoint(x: 113.48, y: 190.92), controlPoint2: CGPoint(x: 116.38, y: 185.86))
        bezierPath.addCurve(to: CGPoint(x: 125.47, y: 143.25), controlPoint1: CGPoint(x: 117.74, y: 167.08), controlPoint2: CGPoint(x: 119.5, y: 154.17))
        bezierPath.addCurve(to: CGPoint(x: 132.27, y: 133.73), controlPoint1: CGPoint(x: 127.33, y: 139.85), controlPoint2: CGPoint(x: 129.6, y: 136.65))
        bezierPath.addCurve(to: CGPoint(x: 153.83, y: 120.63), controlPoint1: CGPoint(x: 138.43, y: 127), controlPoint2: CGPoint(x: 145.93, y: 122.63))
        bezierPath.addCurve(to: CGPoint(x: 163.99, y: 103), controlPoint1: CGPoint(x: 159.22, y: 111.27), controlPoint2: CGPoint(x: 163.99, y: 103))
        bezierPath.addLine(to: CGPoint(x: 164, y: 103.01))
        bezierPath.close()
        UIColor.gray.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
        
        // Bezier 3 Drawing
        context.saveGState()
        context.translateBy(x: 163.99, y: 160.25)
        context.rotate(by: -(azimuth - 90) * CGFloat(PI) / 180)
        
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: -127.39, y: -21.6))
        bezier3Path.addCurve(to: CGPoint(x: -127.39, y: 20.92), controlPoint1: CGPoint(x: -127.39, y: -21.6), controlPoint2: CGPoint(x: -127.39, y: 20.92))
        bezier3Path.addCurve(to: CGPoint(x: -140.84, y: 7.39), controlPoint1: CGPoint(x: -127.39, y: 20.92), controlPoint2: CGPoint(x: -138.08, y: 10.16))
        bezier3Path.addLine(to: CGPoint(x: -156.2, y: 7.39))
        bezier3Path.addLine(to: CGPoint(x: -156.2, y: -9.36))
        bezier3Path.addLine(to: CGPoint(x: -140.84, y: -9.36))
        bezier3Path.addCurve(to: CGPoint(x: -127.39, y: -21.6), controlPoint1: CGPoint(x: -138.08, y: -11.82), controlPoint2: CGPoint(x: -127.39, y: -21.6))
        bezier3Path.addLine(to: CGPoint(x: -127.39, y: -21.6))
        bezier3Path.close()
        UIColor.gray.setStroke()
        bezier3Path.lineWidth = 1
        bezier3Path.stroke()
        
        context.restoreGState()
    }
   
}
