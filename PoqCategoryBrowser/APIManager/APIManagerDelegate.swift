//
//  APIManagerDelegate.swift
//  PoqCategoryBrowser
//
//  Created by Zoran Plesko on 13/12/14.
//  Copyright (c) 2014 Masinerija. All rights reserved.
//

import UIKit

protocol APIManagerDelegate{
    
    func fetchingCategoriesFailedWith(error: NSError)
    
    func fetchingCategoriesSuccededWith(result: [PoqCategoryModel]?)
   
}
