//
//  CaptureProgress.swift
//  VideoReplay
//
//  Created by Paul Vagner on 11/12/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

@IBDesignable class CaptureProgress: UIView {

    @IBInspectable var strokeColor: UIColor = UIColor.redColor()
    
    @IBInspectable var strokeWidth: CGFloat = 0
    
    @IBInspectable var circleInset: CGFloat = 3
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        let insetRect = CGRectInset(rect, circleInset, circleInset)
        
        strokeColor.set()
        
        CGContextSetLineWidth(context, strokeWidth)
        
        CGContextStrokeEllipseInRect(context, CGRectInset(rect, circleInset, circleInset))
        
        
        
    }
    
}


