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
    var timer = NSTimer()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        magnetView = ISMagnetView(frame: self.view.frame)
        self.view.addSubview(magnetView)
        
        magnet = magnetView.magnet
        
        
        timer = NSTimer(timeInterval: 1/60.0, target: self, selector: "loop:", userInfo: nil, repeats: true)
        let runLoop = NSRunLoop.currentRunLoop()
        runLoop.addTimer(timer, forMode: NSDefaultRunLoopMode)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func loop(timer: NSTimer) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), { () -> Void in
            self.magnetView.updateView()
            print(self.magnet.point.x)
            
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                
            })
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

