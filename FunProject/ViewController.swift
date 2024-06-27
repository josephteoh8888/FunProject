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
        
        //method 1: direct call to elastic search cluster(NOT recommended)
//        let url = URL(string: "https://my-deployment-144777.es.asia-southeast1.gcp.elastic-cloud.com/")!
        let url = URL(string: "https://my-deployment-144777.es.asia-southeast1.gcp.elastic-cloud.com/books/_search")!
        let body : [String: Any] = ["query": [
            "match": [
                "name": "new"]
            ]
        ]
        let jsonSearchQuery = try? JSONSerialization.data(withJSONObject: body)
        let password = "elastic:XXX" //replace XXX with elastic super user password
        let authData = password.data(using: .utf8)!
        let base64AuthString = authData.base64EncodedString()
        var request = URLRequest(url: url)
//        request.httpMethod = "GET" //POST
        request.httpMethod = "POST" //POST
        request.setValue("Basic \(base64AuthString)", forHTTPHeaderField: "Authorization")
        request.httpBody = jsonSearchQuery
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
//                    print("response data: \(json)")
                    //decode JSON data
                    if let jsonDict = json as? [String: Any] {
                        if let hits = jsonDict["hits"] as? [String: Any], let hitsArray = hits["hits"] as? [[String: Any]]{
//                            print("hits: \(hits)")
                            for hit in hitsArray {
                                if let source = hit["_source"] as? [String: Any] {
                                    print("source \(source)")
                                }
                            }
                        }
                    }
                } catch{
                    print("error decoding json: \(error.localizedDescription)")
                }
            }

        }
        task.resume()
        
        //method 2: using app search(like a engine, but limited function, no autocomplete)
//        let appSearchUrl = URL(string: "https://my-deployment-144777.ent.asia-southeast1.gcp.elastic-cloud.com/api/as/v1/engines/trial-engine/search")!
//        let authToken = "Bearer search-c74i6awzypijnipfftup3rbm" //public key
//        let appSearchBody : [String: Any] = ["query": "a"] //new
//        let appSearchJsonSearchQuery = try? JSONSerialization.data(withJSONObject: appSearchBody)
//        var request = URLRequest(url: appSearchUrl)
//        request.httpMethod = "POST" //POST
//        request.setValue(authToken, forHTTPHeaderField: "Authorization")
//        request.httpBody = appSearchJsonSearchQuery
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let task = URLSession.shared.dataTask(with: request){(data, response, error) in
//            if let data = data {
//                print("data fetched success: \(data)")
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    print("response data: \(json)")
//                } catch{
//                    print("error decoding json: \(error.localizedDescription)")
//                }
//            }
//        }
//        task.resume()
        
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

