//
//  APICommunicationTests.swift
//  PoqCategoryBrowser
//
//  Created by Zoran Plesko on 14/12/14.
//  Copyright (c) 2014 Masinerija. All rights reserved.
//

import UIKit
import XCTest

class APICommunicationTests: XCTestCase {
    
    let apiCommunicator: APICommunicator = APICommunicator()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGettingCategoriesByAppId() {
        let readyExpectation = expectationWithDescription("ready")
 
        apiCommunicator.getCategoriesFor(75, success: { (responseObject) -> Void in
            readyExpectation.fulfill()
        })
        
        waitForExpectationsWithTimeout(15, handler: { (error) -> Void in
            XCTAssertNil(error, "Should be no errors in getting cateogries by app id")
        })
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
