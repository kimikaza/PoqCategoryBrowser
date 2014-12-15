//
//  PoqCategoryModelBuilder.swift
//  PoqCategoryBrowser
//
//  Created by Zoran Plesko on 13/12/14.
//  Copyright (c) 2014 Masinerija. All rights reserved.
//

import UIKit

enum PoqCategoryModelBuilderError: Int {
    case InvalidJSONError = 1
}

class PoqCategoryModelBuilder: NSObject {
    
    let poqCategoryModelBuilderError = "PoqCategoryModelBuilderError"
    
    var JSONString: String?
    
    func poqCategoryModelJsonsFrom(json: String, inout error: NSError?) -> JSON?
    {
        self.JSONString = json
        var utfData = json.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        var localError: NSError?
        
        
        if let utfDataValue = utfData {
            
            let jsonObject = JSON(data: utfDataValue)
            
            return jsonObject
            
        }
        
        return nil
    }
    
    func poqCategoryModelFrom(jsonDictionary: JSON) -> PoqCategoryModel
    {
        
        let hasSubCategory: Bool = jsonDictionary["hasSubCategory"].boolValue
        let id: Int = jsonDictionary["id"].integerValue!
        let stringId: String = jsonDictionary["$id"].stringValue!
        let sortIndex: Int = jsonDictionary["sortIndex"].integerValue!
        let thumbnailUrl: String = jsonDictionary["thumbnailUrl"].stringValue!
        let title : String = jsonDictionary["title"].stringValue!
        let thumbnailHeight: CGFloat = CGFloat(jsonDictionary["thumbnailHeight"].doubleValue!)
        let thumbnailWidth: CGFloat = CGFloat(jsonDictionary["thumbnailWidth"].doubleValue!)
        
        var subCategories: [JSON]?
        if jsonDictionary["subCategories"].arrayValue != nil {
            subCategories = jsonDictionary["subCategories"].arrayValue!
        }else{
            subCategories = nil
        }
        
        let categoryType: String = jsonDictionary["categoryType"].stringValue!
        let parentCategoryId: Int = jsonDictionary["parentCategoryId"].integerValue!
        let categoryId: Int = jsonDictionary["categoryId"].integerValue!
        
        var poqCategoryModel = PoqCategoryModel(hasSubCategory: hasSubCategory,
                                                id: id,
                                                stringId: stringId,
                                                sortIndex: sortIndex,
                                                thumbnailUrl: thumbnailUrl,
                                                title: title,
                                                thumbnailHeight: thumbnailHeight,
                                                thumbnailWidth: thumbnailWidth,
                                                subCategories: subCategories,
                                                categoryType: categoryType,
                                                parentCategoryId: parentCategoryId,
                                                categoryId: categoryId)
        
        return poqCategoryModel
 
    }
    
    
   
}
