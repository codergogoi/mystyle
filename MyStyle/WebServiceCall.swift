//
//  WebServiceCall.swift
//  MyStyle
//
//  Created by MAC01 on 26/09/17.
//  Copyright © 2017 Jayanta Gogoi. All rights reserved.
//

import UIKit

class WebServiceCall: NSObject {
    
    class func performRequest(url :String, dict : NSMutableDictionary, completion:@escaping (_ responseData : AnyObject)-> Void){
        
        let request = NSMutableURLRequest(url : URL(string: url)!)
        
        //Rest of all required paramaters need to provide from specific model
        
        //add required Parameters to request Dictionary
        dict.setObject("ios", forKey: "ostype" as NSCopying)
        //initilise request
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST";
        
        let postData = try! JSONSerialization.data(withJSONObject: dict, options: [])
        
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil && data != nil else{
                
                completion(data as AnyObject)
                print("Error found \(String(describing: error))")
                return
            }
            
            completion(data! as AnyObject)
            
        })
        
        task.resume()
        
        
    }

}
