//
//  PoqCategoryModel.swift
//  PoqCategoryBrowser
//
//  Created by Zoran Plesko on 13/12/14.
//  Copyright (c) 2014 Masinerija. All rights reserved.
//

import UIKit

class PoqCategoryModel: NSObject {
    
    var hasSubCategory: Bool
    var id: Int
    var stringId: String
    var sortIndex: Int
    var thumbnailUrl: String
    var title : String
    var thumbnailHeight: CGFloat
    var thumbnailWidth: CGFloat
    var subCategories: [JSON]?
    var categoryType: String
    var parentCategoryId: Int
    var categoryId: Int
    
    init( hasSubCategory: Bool,
            id: Int,
            stringId: String,
            sortIndex: Int,
            thumbnailUrl: String,
            title : String,
            thumbnailHeight: CGFloat,
            thumbnailWidth: CGFloat,
            subCategories: [JSON]?,
            categoryType: String,
            parentCategoryId: Int,
            categoryId: Int )
    {
        self.hasSubCategory = hasSubCategory
        self.id = id
        self.stringId = stringId
        self.sortIndex = sortIndex
        self.thumbnailUrl = thumbnailUrl
        self.title = title
        self.thumbnailHeight = thumbnailHeight
        self.thumbnailWidth = thumbnailWidth
        self.subCategories = subCategories
        self.categoryType = categoryType
        self.parentCategoryId = parentCategoryId
        self.categoryId = categoryId
    }
   
}
