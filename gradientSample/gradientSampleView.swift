//
//  gradientSampleView.swift
//  gradientSample
//
//  Created by shadowPriest on 15/6/4.
//  Copyright (c) 2015年 hxx. All rights reserved.
//

import UIKit

class gradientSampleView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        var c = UIGraphicsGetCurrentContext()
        var arc = CGPathCreateMutable()
        var m = CGAffineTransformIdentity
//        CGPathMoveToPoint(arc, &m, 120.0, 150.0)
        CGPathAddArc(arc, &m,CGFloat(120.0), CGFloat(150.0),CGFloat( 50.0), CGFloat (0.0), CGFloat(2*M_PI), true)
        var lineWidth:CGFloat = 10.5
        var strokedArc = CGPathCreateCopyByStrokingPath(arc, &m, lineWidth, kCGLineCapButt, kCGLineJoinMiter, CGFloat(10))
        var colors = [
            CGFloat(0.3),CGFloat(0.2),CGFloat(0.9),CGFloat(1.0),
            CGFloat(0.4),CGFloat(0.8),CGFloat(0.3),CGFloat(1.0)
        ]
        var l = [
            CGFloat(0.0),
            CGFloat(1.0)
        ]
        var baseSpace = CGColorSpaceCreateDeviceRGB()
        var gradient = CGGradientCreateWithColorComponents(baseSpace, &colors, &l, 2)
        CGContextSaveGState(c);
        CGContextAddPath(c, strokedArc);
        CGContextClip(c);
        
        var boundingBox = CGPathGetBoundingBox(strokedArc);
        var gradientStart = CGPointMake(0, CGRectGetMinY(boundingBox));
        var gradientEnd   = CGPointMake(0, CGRectGetMaxY(boundingBox));
        
        CGContextDrawLinearGradient(c, gradient, gradientStart, gradientEnd, 0);
        CGContextRestoreGState(c);
        CGContextDrawPath(c, kCGPathFillStroke);
    }
    

}
