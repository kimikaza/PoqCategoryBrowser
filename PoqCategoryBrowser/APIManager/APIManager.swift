//
//  APIManager.swift
//  PoqCategoryBrowser
//
//  Created by Zoran Plesko on 13/12/14.
//  Copyright (c) 2014 Masinerija. All rights reserved.
//

import UIKit


enum APIManagerError: Int {
    case APIManagerErrorGettingCategory = 1
}

class APIManager: NSObject {
    
    //MARK: - props
    
    let apiManagerError = "APIManagerError"
    
    var delegate: APIManagerDelegate
    
    let applicationID: Int = 75
    
    let apiCommunicator: APICommunicator = APICommunicator()
    
    var poqCategoryModelBuilder: PoqCategoryModelBuilder
    
    
    //MARK: - init
    
    init( delegate: APIManagerDelegate)
    {
        self.delegate = delegate;
        self.poqCategoryModelBuilder = PoqCategoryModelBuilder()
    }
    
    //MARK: - call communicator
    
    func getCategories(categoryId: Int?)
    {
        if let categoryIdValue = categoryId {
            
            apiCommunicator.getCategoriesFor(applicationID, categoryId: categoryIdValue, success: { (responseObject) -> Void in
                let models: [PoqCategoryModel]? = self.prepareCategoryList(responseObject)
                self.delegate.fetchingCategoriesSuccededWith(models)
            })
            
        }else{
            
            apiCommunicator.getCategoriesFor(applicationID, success: { (responseObject) -> Void in
                let models: [PoqCategoryModel]? = self.prepareCategoryList(responseObject)
                self.delegate.fetchingCategoriesSuccededWith(models)
            })
        }
        
    }
    
    func prepareCategoryList(jsonEnum: JSON?) -> [PoqCategoryModel]?
    {
        if let jsonEnumValue = jsonEnum{
            
            var outboundArray: [PoqCategoryModel] = []
            for jsonDictionary in jsonEnumValue.arrayValue!
            
            {
                outboundArray.append( self.poqCategoryModelBuilder.poqCategoryModelFrom(jsonDictionary) )
            }
            
            if outboundArray.count > 0 {
                return outboundArray
            }else{
                return nil
            }
        
        }
        
        return nil
    }
    
    // MARK: - calls to delegate
    
    func gettingCategoryFailedWith(error: NSError)
    {
        let errorInfo: [NSObject : AnyObject]? = [NSUnderlyingErrorKey:error]
        let reportableError = NSError(domain: apiManagerError, code: APIManagerError.APIManagerErrorGettingCategory.rawValue, userInfo: errorInfo)
        
        delegate.fetchingCategoriesFailedWith(reportableError)
    }
}
