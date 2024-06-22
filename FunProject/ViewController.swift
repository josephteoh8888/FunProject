//
//  ViewController.swift
//  FunProject
//
//  Created by Joseph Teoh on 20/06/2024.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let whiteCover = UIView()
//        whiteCover.frame = view.bounds
//        whiteCover.backgroundColor = .blue
//        view.addSubview(whiteCover)
        
        GMSServices.provideAPIKey("AIzaSyBOD7PnDnBW5PlensQ_pwa2bEjh8iNZ0oQ")
        
        let options = GMSMapViewOptions()
        options.camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        options.frame = self.view.bounds
        
        let mapView = GMSMapView(options: options)
        self.view.addSubview(mapView)
    }

    //hahaha
    //weight 10
    
    
    //Rectangle 2.0
    //3.0 Blue
    
    //4.0 circle
}

