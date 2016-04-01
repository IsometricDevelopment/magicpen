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
        
        self.locationManager.delegate = self
    }
    
    //MARK: CoreLocation Methods
    
    func locationManagerShouldDisplayHeadingCalibration(manager: CLLocationManager) -> Bool {
        return false
    }
    
    func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("\(newHeading.x),\(newHeading.y)")
        self.rawHeading = newHeading
        self.quadrant = quadrant(newHeading)
        self.magnitude = magnitude(newHeading)
        self.radius = radius(self.magnitude)
        self.angle = angle(newHeading)
        
        if self.quadrant == 1 {
            x = magnitude * cos(angle)
            y = magnitude * sin(angle)
        } else if self.quadrant == 2 {
            x = magnitude * cos(angle) * -1
            y = magnitude * sin(angle)
        } else if self.quadrant == 3 {
            x = magnitude * cos(angle) * -1
            y = magnitude * sin(angle) * -1
        } else if self.quadrant == 4 {
            x = magnitude * cos(angle)
            y = magnitude * sin(angle) * -1
        }
        
        point = CGPoint(x: newHeading.x, y: newHeading.y)
    }
    
    //MARK: Helper Methods
    
    func magnitude(heading: CLHeading) -> Double {
        
        return sqrt(pow(heading.x, 2)+pow(heading.y, 2)+pow(heading.z,2))
    }
    
//    func magnitude(x: Double, y: Double, z: Double) -> Double {
//        return sqrt(x+y+z)
//    }
    
    func radius(magnitude: Double) -> Double {
//        radius = log(max(magnitude,0.01))/log(1.4933)
        radius = log(magnitude)
        return radius
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
