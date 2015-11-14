//
//  CaptureProgress.swift
//  VideoReplay
//
//  Created by Paul Vagner on 11/12/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

@IBDesignable class CaptureProgress: UIView {

    @IBOutlet weak var  secondsLabel: UILabel!
    
    @IBInspectable var progressAmount: CGFloat = 0 {
        
        didSet {
            
            setNeedsDisplay()
           secondsLabel?.text = "\(Int(progressAmount / 10))"
    
        }
   
    }
    
    @IBInspectable var progressColor: UIColor = UIColor.redColor().colorWithAlphaComponent(0.4)
    
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetLineWidth(context, 4)
        
        //back middle circle
        CGContextSetLineCap(context, .Round)
        
        UIColor(white: 0, alpha: 0.1).set()
        
        
        //top left cicrle
        CGContextStrokeEllipseInRect(context, CGRectInset(rect, 20, 20))
        
        progressColor.set()
        
        CGContextFillEllipseInRect(context, CGRect(x: 5, y: 5, width: 30, height: 30))

        
        //progress circle
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.width / 2 - 20
        let startAngle = -CGFloat(M_PI * 2 * 0.25)
        let progressAngle = CGFloat(M_PI * 2) * (progressAmount / 100) + startAngle
        
        
        let progressPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: progressAngle, clockwise: true)
        
        CGContextAddPath(context, progressPath.CGPath)
        
        CGContextStrokePath(context)
        
        // draw seconds
//        
//        let seconds: NSString = "\(Int(progressAmount / 10))"
//        
//       seconds.drawInRect(CGRect(x: 6, y: 6, width: 30, height: 30), withAttributes: nil)
    }
    
}


