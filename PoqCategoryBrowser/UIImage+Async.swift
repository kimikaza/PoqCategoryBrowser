//
//  UIImage+Async.swift
//  PoqCategoryBrowser
//
//  Created by Zoran Plesko on 14/12/14.
//  Copyright (c) 2014 Masinerija. All rights reserved.
//

import UIKit
import Alamofire

extension UIImageView {
    
    func setImageWith(URL: String, placeholderImage: UIImage?)
    {
        if placeholderImage != nil {
            self.image = placeholderImage
        }
        
        Alamofire.request(.GET, URL)
            .response{ (_, _, data, _) in
                
                var image = UIImage(data: data as NSData)
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.image = image
                })
        }

    }
   
}
