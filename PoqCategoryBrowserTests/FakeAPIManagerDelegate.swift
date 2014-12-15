//
//  FakeAPIManagerDelegate.swift
//  PoqCategoryBrowser
//
//  Created by Zoran Plesko on 14/12/14.
//  Copyright (c) 2014 Masinerija. All rights reserved.
//

import UIKit

class FakeAPIManagerDelegate: APIManagerDelegate {
    
    func fetchingCategoriesFailedWith(error: NSError)
    {
        //nothing
    }
    
    func fetchingCategoriesSuccededWith(result: [PoqCategoryModel]?)
    {
        //nothing
    }
   
}
