//
//  MapViewController.swift
//  ByteShiftDemo
//
//  Created by Cher Moua on 7/21/17.
//  Copyright © 2017 ByteShift. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: UUID(uuidString: "01234567-0123-0123-0123-012345678910")!, identifier: "Estimotes")
    let backgroundImages = [
        // key are the minor values
        11960: #imageLiteral(resourceName: "mapsamplettop"),
        53700: #imageLiteral(resourceName: "mapsamplemiddle"),
        25536: #imageLiteral(resourceName: "mapsamplebottom")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "mapsample"))
        //self.view.backgroundColor = .white
        
        self.locationManager.delegate = self
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse){
            locationManager.requestWhenInUseAuthorization()
            
        }
        locationManager.startRangingBeacons(in: region)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        let knownBeacons = beacons.filter{$0.proximity != CLProximity.unknown}
        if(knownBeacons.count > 0){
            let closestBeacon = knownBeacons[0] as CLBeacon
            if(self.backgroundImages[closestBeacon.minor.intValue] != nil){
                self.view.backgroundColor = UIColor(patternImage: self.backgroundImages[closestBeacon.minor.intValue]!)
            }
        }
        else{
            self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "mapsample"))
        }
    }


}
