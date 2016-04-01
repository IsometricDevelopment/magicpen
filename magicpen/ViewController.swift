//
//  ViewController.swift
//  magicpen
//
//  Created by Joshua Liu on 2/4/16.
//  Copyright © 2016 Isometric Studios. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    var magnetView = ISMagnetView()
    var magnet = ISMagnet()
    var timer = CADisplayLink()
    var locationManager = CLLocationManager()
    var p = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        magnetView = ISMagnetView(frame: self.view.frame)
        self.view.addSubview(magnetView)
        
        magnet = magnetView.magnet
        
        
        timer = CADisplayLink(target: self, selector: #selector(ViewController.loop))
        timer.frameInterval = 1
        timer.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSRunLoopCommonModes)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func loop(timer: NSTimer) {
        self.magnetView.cursor.center = self.p
        self.magnetView.updateView()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), { () -> Void in
            
            
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                
            })
        })
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            p = touch.locationInView(self.view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

