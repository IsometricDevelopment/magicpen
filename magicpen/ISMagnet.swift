//
//  ISMagnet.swift
//  magicpen
//
//  Created by Joshua Liu on 2/5/16.
//  Copyright © 2016 Isometric Studios. All rights reserved.
//

import UIKit
import CoreLocation

class ISMagnet: NSObject, CLLocationManagerDelegate {
    
    var x : Double
    var y : Double
    var z : Double
    var quadrant : Int
    var magnitude : Double
    var radius : Double
    var angle : Double
    var point : CGPoint
    
    var rawHeading : CLHeading = CLHeading()
    
    var locationManager : CLLocationManager
    
    override init() {
        x = 0
        y = 0
        z = 0
        magnitude = 0
        radius = 0
        angle = 0
        quadrant = 1
        point = CGPointMake(0, 0)
        
        self.locationManager = CLLocationManager()
        
        locationManager.startUpdatingHeading()
        
        super.init()
    }
    
    func locationManagerShouldDisplayHeadingCalibration(manager: CLLocationManager) -> Bool {
        return false
    }
    
    func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.rawHeading = newHeading
        self.quadrant = quadrant(newHeading)
        self.magnitude = magnitude(newHeading)
        self.radius = radius(self.magnitude)
        self.angle = angle(newHeading)
        
        if self.quadrant == 1 || self.quadrant == 2 {
            
        }
        
        
    }
    
    func magnitude(heading: CLHeading) -> Double {
        return sqrt(heading.x+heading.y+heading.z)
    }
    
    func magnitude(x: Double, y: Double, z: Double) -> Double {
        return sqrt(x+y+z)
    }
    
    func radius(magnitude: Double) -> Double {
        radius = log(max(((magnitude-100)/195.38),1))/log(1.4933)
        return radius*100
    }
    
    func angle(heading: CLHeading) -> Double {
        return atan(heading.y/heading.x)
    }
    
    func angle(x: Double, y: Double) -> Double {
        return atan(y/x)
    }
    
    func quadrant(heading: CLHeading) -> Int {
        if heading.x > 0 {
            if heading.y > 0 {
                return 1
            } else {
                return 4
            }
        } else {
            if heading.y > 0 {
                return 2
            } else {
                return 3
            }
        }
    }
    
    func quadrant(x: Double, y: Double) -> Int {
        if x > 0 {
            if y > 0 {
                return 1
            } else {
                return 4
            }
        } else {
            if y > 0 {
                return 2
            } else {
                return 3
            }
        }
    }

}
