//
//  ISMagnetView.swift
//  magicpen
//
//  Created by Joshua Liu on 2/5/16.
//  Copyright © 2016 Isometric Studios. All rights reserved.
//

import UIKit
import CoreLocation

class ISMagnetView: UIView {
    var magnet : ISMagnet
    var cursor : UIView
    
    
    override convenience init(frame: CGRect) {
        self.init()
        self.frame = frame
        
    }
    
    init() {
        magnet = ISMagnet()
        cursor = UIView(frame: CGRect(x: 1, y: 1, width: 5, height: 5))
        cursor.backgroundColor = UIColor.blackColor()
        super.init(frame: CGRectZero)
        layoutSubviews()
        
    }
    
    override func layoutSubviews() {
        print("lol")
        self.addSubview(cursor)
        cursor.center = self.center
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {
        
        switch (self.magnet.quadrant) {
        case 1:
            frame.origin = CGPointMake(CGRectGetMaxX(self.frame) - frame.size.width, 0);
            break;
        case 2:
            frame.origin = CGPointZero;
            break;
        case 3:
            frame.origin = CGPointMake(0, CGRectGetMaxY(self.frame) - frame.size.height);
            break;
        case 4:
            frame.origin = CGPointMake(
                CGRectGetMaxX(self.frame) - frame.size.width,
                CGRectGetMaxY(self.frame) - frame.size.height);
            break;
        }
        
        cursor.center = CGPoint(x: self.center.x+self.magnet.point.x, y: self.center.y+self.magnet.point.y)
    }
    
//    func point(magnet : ISMagnet) -> CGPoint {
//
//        return CGPoint(x: 0, y: 0)
//    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
