//
//  APICommunicator.swift
//  PoqCategoryBrowser
//
//  Created by Zoran Plesko on 13/12/14.
//  Copyright (c) 2014 Masinerija. All rights reserved.
//

import UIKit
import Alamofire


//Networking with: https://github.com/Alamofire/Alamofire

class APICommunicator: NSObject {

    let baseURLString = "http://poq-api-uat.cloudapp.net"
    
    
    func getCategoriesFor(appId: Int, success: (responseObject: JSON?) -> Void)
    {
        let url = "\(baseURLString)/api/categories/\(appId)"
        Alamofire.request(.GET, url)
            .responseJSON { (_, _, jsonResponse, _) in
                println("ImamoJSON:\(jsonResponse)")
                success(responseObject: JSON(object: jsonResponse!))

            }
    }
    
    func getCategoriesFor(appId: Int, categoryId: Int, success: (responseObject: JSON?) -> Void)
    {
        let url = "\(baseURLString)/api/categories/\(appId)/\(categoryId)"
        Alamofire.request(.GET, url)
            .responseJSON { (_, _, jsonResponse, _) in
                println("ImamoJSON:\(jsonResponse)")
                success(responseObject: JSON(object: jsonResponse!))
                
        }
    }
    
    func getCategoriesForParentCategoryId(parentCategoryId: Int)
    {
        
    }
   
}
