//
//  NetWorkCall.swift
//  CodeLapTaskOne
//
//  Created by Ahmed Baloch on 10/06/2021.
//

import Foundation
import Alamofire

class NetWorkCall {
   static var AlmoAF = Alamofire.AF
    
   static func getCall(url : String , completation : @escaping (NSArray)-> Void ) {
        
    AlmoAF.request(url, method : .post , encoding: JSONEncoding.prettyPrinted).responseJSON { (response) in
        switch response.result {
                        case .success(let JSON):
                            print("Success with JSON: \(JSON)")

                            let response = JSON as! NSDictionary
                            let statuscode = response.value(forKey: "status-code") as! Int
                            if statuscode == 200 {
                                completation(response.value(forKey: "data") as! NSArray)
                            }
                          

                        case .failure(let error):
                            print("Request failed with error: \(error.errorDescription)")
                        }
    }
            
        }
    
}
