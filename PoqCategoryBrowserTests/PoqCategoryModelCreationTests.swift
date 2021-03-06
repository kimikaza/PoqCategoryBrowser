//
//  PoqCategoryModelCreationTests.swift
//  PoqCategoryBrowser
//
//  Created by Zoran Plesko on 13/12/14.
//  Copyright (c) 2014 Masinerija. All rights reserved.
//

import UIKit
import XCTest

class PoqCategoryModelCreationTests: XCTestCase {
    
    var mgr: APIManager?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let poqCategoryModuleBuilder = PoqCategoryModelBuilder()
        let fakeAPIManagerDelegate = FakeAPIManagerDelegate()
        mgr = APIManager(delegate: fakeAPIManagerDelegate)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        mgr = nil
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
