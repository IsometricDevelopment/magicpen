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
        cursor = UIView(frame: CGRect(x: 1, y: 1, width: 1, height: 1))
        super.init(frame: CGRectZero)
        layoutSubviews()
        
    }
    
    override func layoutSubviews() {
        print("lol")
        self.backgroundColor = UIColor.redColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {
        
    }
    
    func point(magnet : ISMagnet) -> CGPoint {

        return CGPoint(x: 0, y: 0)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
