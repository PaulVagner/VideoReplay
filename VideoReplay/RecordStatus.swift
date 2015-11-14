//
//  RecordStatus.swift
//  VideoReplay
//
//  Created by Paul Vagner on 11/12/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

@IBDesignable class RecordStatus: UIView {

    @IBInspectable var color: UIColor = UIColor.lightGrayColor()
    
    @IBInspectable var isRecording: Bool = false {
        
        didSet { setNeedsDisplay() }
    }
    
    
    
    var centerColor: UIColor {
        
        return isRecording ? UIColor(red:0.73, green:0.23, blue:1, alpha:1) : UIColor.blackColor()
    }
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
       
        CGContextSetLineWidth(context, 2)
        
        UIColor(white: 0, alpha: 0.4).set()
        
        CGContextStrokeEllipseInRect(context, CGRectInset(rect, 1, 1))
        
        centerColor.set()
        
        CGContextFillEllipseInRect(context, CGRectInset(rect, 4, 4))
        
        
        
//        color.set()
//        
//        let insideRect = CGRectInset(rect, 10, 10)
//        
//        let outsideRect = CGRectInset(rect, 05, 05)
//        
//        CGContextFillEllipseInRect(context, insideRect)
//        
//        CGContextStrokeEllipseInRect(context, outsideRect)
      
    }

}