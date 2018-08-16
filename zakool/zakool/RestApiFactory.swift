//
//  RestApiFactory.swift
//  zakool
//
//  Created by Niwech Harnkham on 5/30/16.
//  Copyright © 2016 EKSPERTSOFT, LLC. All rights reserved.
//

import Foundation

typealias ServiceResponse = (JSON, NSError?) -> Void

class RestApiFactory: NSObject {
    
    static let FACTORY = RestApiFactory()
    
    let baseURL = "https://zakool-ekspertsoft.rhcloud.com/"
    
    func getHealth(onCompletion: (JSON) -> Void) {
        let route = baseURL
        makeHTTPGetRequest(route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    func getInstate(amount: String, onCompletion: (JSON) -> Void){
        let route = baseURL + "/instate/oncampus/" + amount
        makeHTTPGetRequest(route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    func search(min: String, max: String, onCompletion: (JSON) -> Void){
        let route = baseURL + "/search/\(min)/\(max)"
        makeHTTPGetRequest(route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    // MARK: Perform a GET Request
    private func makeHTTPGetRequest(path: String, onCompletion: ServiceResponse) {
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            if let jsonData = data {
                let json:JSON = JSON(data: jsonData)
                onCompletion(json, error)
            } else {
                onCompletion(nil, error)
            }
        })
        task.resume()
    }

}
