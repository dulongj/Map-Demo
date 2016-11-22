//
//  ViewController.swift
//  Map Demo
//
//  Created by Jeremy Dulong on 12/10/15.
//  Copyright © 2015 Jeremy Dulong. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        let tewksbury = MKCoordinateRegionMake(CLLocationCoordinate2DMake(42.6106, -71.2347), MKCoordinateSpanMake(0.2, 0.2))
        
        mapView.setRegion(tewksbury, animated: true)
        
        cameraSetup()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    fileprivate func cameraSetup(){
        
        mapView.camera.heading = 180
        mapView.camera.altitude = 2000
        mapView.camera.pitch = 50
        
    }
    
    @IBAction func segmentControlChanged(_ sender: AnyObject) {
        
        switch sender.selectedSegmentIndex {
            
        case 1:
            mapView.mapType = MKMapType.satelliteFlyover
            
        case 2:
            mapView.mapType = MKMapType.hybridFlyover
            
        default:
            mapView.mapType = MKMapType.standard
        }
        
            cameraSetup()
        
    }
    
    @IBAction func trafficButton(_ sender: AnyObject) {
        
        mapView.showsTraffic = !mapView.showsTraffic
        
        if mapView.showsTraffic == true {
            sender.setTitle("Hide Traffic", for: UIControlState())
        }
        else {
            sender.setTitle("Show Traffic", for: UIControlState())
        }
        
    }

    @IBAction func compassButton(_ sender: AnyObject) {
        
        mapView.showsCompass = !mapView.showsCompass
        
        if mapView.showsCompass == true {
            sender.setTitle("Hide Compass", for: UIControlState())
        }
        else {
            sender.setTitle("Show Compass", for: UIControlState())
        }
    }
    
    @IBAction func zoomIn(_ sender: AnyObject) {
        
        mapView.camera.altitude -= 750
        
    }
    
    @IBAction func zoomOut(_ sender: AnyObject) {
        
        mapView.camera.altitude += 750
        
    }
}

