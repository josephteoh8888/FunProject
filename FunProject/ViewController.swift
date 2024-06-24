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
        
        let whiteCover = UIView()
        whiteCover.frame = view.bounds
        whiteCover.backgroundColor = .blue
        view.addSubview(whiteCover)
        
        print("fetch data")
//        let url = URL(string: "https://my-deployment-144777.es.asia-southeast1.gcp.elastic-cloud.com/")!
        let url = URL(string: "https://my-deployment-144777.es.asia-southeast1.gcp.elastic-cloud.com/books/_search")!
        let body : [String: Any] = ["query": [
            "match": [
                "name": "brave"]
            ]
        ]
        let jsonSearchQuery = try? JSONSerialization.data(withJSONObject: body)
        
        let password = "elastic:XXX" //replace XXX with elastic super user password
        let authData = password.data(using: .utf8)!
        let base64AuthString = authData.base64EncodedString()
        var request = URLRequest(url: url)
        request.httpMethod = "GET" //POST
        request.setValue("Basic \(base64AuthString)", forHTTPHeaderField: "Authorization")
//        request.httpBody = jsonSearchQuery
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request){(data, response, error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                print("data fetched success: \(data)")
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("response data: \(json)")
                } catch{
                    print("error decoding json: \(error.localizedDescription)")
                }
            }
//            print("data fetched success")
//            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
        
//
//        let options = GMSMapViewOptions()
//        options.camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
//        options.frame = self.view.bounds
//        
//        let mapView = GMSMapView(options: options)
//        self.view.addSubview(mapView)
    }

    //hahaha
    //weight 10
    
    
    //Rectangle 2.0
    //3.0 Blue
    
    //4.0 circle
}

