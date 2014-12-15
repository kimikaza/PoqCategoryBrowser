//
//  CategoryModelTests.swift
//  PoqCategoryBrowser
//
//  Created by Zoran Plesko on 13/12/14.
//  Copyright (c) 2014 Masinerija. All rights reserved.
//

import UIKit
import XCTest

class PoqCategoryModelTests: XCTestCase {
    
    let poqCategoryModel: PoqCategoryModel = PoqCategoryModel(hasSubCategory: false,
                                                id: 6470,
                                                stringId: "1",
                                                sortIndex: 6,
                                                thumbnailUrl: "http://az412776.vo.msecnd.net/app75/153709-320.jpg",
                                                title: "FEATURED",
                                                thumbnailHeight: 160,
                                                thumbnailWidth: 160,
                                                subCategories: nil,
                                                categoryType: "2",
                                                parentCategoryId: 0,
                                                categoryId: 6470)

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
       
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testThatPoqCategoryModelExists()
    {
        XCTAssertNotNil(poqCategoryModel, "PoqCategory model instance should exist")
    }
    
    func testThatPoqCategoryModelCanHaveHasSubCategory()
    {
        XCTAssertEqual(poqCategoryModel.hasSubCategory, false, "hasSubcategory should be what was given initialy")
    }
    
    func testThatPoqCateogryModelCanHaveId()
    {
        XCTAssertEqual(poqCategoryModel.id, 6470, "id should be what I initialized")
    }
    
    func testThatPoqCategoryModelCanHaveStringId ()
    {
       XCTAssertEqual(poqCategoryModel.stringId, "1", "id should be what I initialized")
    }
    
    func testThatPoqCategoryModelCanHaveSortIndex ()
    {
        XCTAssertEqual(poqCategoryModel.sortIndex, 6, "sortIndex should be what I initialized")
    }
    
    func testThatPoqCategoryModelCanHaveThumbnailUrl ()
    {
        XCTAssertEqual(poqCategoryModel.thumbnailUrl, "http://az412776.vo.msecnd.net/app75/153709-320.jpg", "thumbnailUrl should be what I initialized")
    }
    
    func testThatPoqCategoryModelCanHaveTitle ()
    {
        XCTAssertEqual(poqCategoryModel.title, "FEATURED", "title should be what I initialized")
    }
    
    func testThatPoqCategoryModelCanHaveThumbnailHeight ()
    {
        XCTAssertEqual(poqCategoryModel.thumbnailHeight, 160.0 as CGFloat, "thumbnailHeight should be what I initialized")
    }

    func testThatPoqCategoryModelCanHaveThumbnailWidth ()
    {
        XCTAssertEqual(poqCategoryModel.thumbnailWidth, 160.0 as CGFloat, "thumbnailWidth should be what I initialized")
    }
    
    func testThatPoqCategoryModelCanHaveSubCategories ()
    {
        XCTAssertTrue(poqCategoryModel.subCategories==nil, "subcategories should be nil as I initialized")
    }
    
    func testThatPoqCategoryModelCanHaveCategoryType ()
    {
        XCTAssertEqual(poqCategoryModel.categoryType, "2", "categoryType should be what I initialized")
    }
    
    func testThatPoqCategoryModelCanHaveParentCategoryId ()
    {
        XCTAssertEqual(poqCategoryModel.parentCategoryId, 0, "parentCategoryId should be what I initialized")
    }

    func testThatPoqCategoryModelCanHaveCategoryId ()
    {
        XCTAssertEqual(poqCategoryModel.categoryId, 6470, "categoryId should be what i initialized")
    }





    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
