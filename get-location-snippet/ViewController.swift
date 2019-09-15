//
//  ViewController.swift
//  get-location-snippet
//
//  Created by Declan on 08/06/2019.
//  Copyright © 2019 Declan Conway. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    //Connect to the UI elements
    let locationManager = CLLocationManager()

    @IBOutlet weak var latLabel: UILabel!
    
    @IBOutlet weak var longLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        latLabel.text = ""
        longLabel.text = ""
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self as CLLocationManagerDelegate
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        
        
    }
    
    //Update the labels with new coordinates 
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        latLabel.text = String(locValue.latitude)
        longLabel.text = String(locValue.longitude)
        
    }


}

