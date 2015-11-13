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
    
      
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        color.set()
        
        let insideRect = CGRectInset(rect, 10, 10)
        
        let outsideRect = CGRectInset(rect, 05, 05)
        
        CGContextFillEllipseInRect(context, insideRect)
        
        CGContextStrokeEllipseInRect(context, outsideRect)
        
       
        

    }

}