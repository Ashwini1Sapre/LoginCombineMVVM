//
//  LoginCombineMVVMUITests.swift
//  LoginCombineMVVMUITests
//
//  Created by Knoxpo MacBook Pro on 31/12/20.
//  Copyright © 2020 Atif. All rights reserved.
//

import XCTest
@testable import LoginCombineMVVM

class LoginCombineMVVMUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testshowloginbuttonaction() {
        
       let app = XCUIApplication()
      //  app.launch()
        
        
        let todoitem = app.textFields["Email"]
        todoitem.tap()
        todoitem.typeText("ab@gmail.com")
        
        
        let toshowpass = app.textFields["Password"]
        toshowpass.tap()
        toshowpass.typeText("Asss@123")
        
        
        app.buttons["Login"].tap()
      //  XCTAssert(app.staticTexts["login success"].exists)//Test Fail
       XCTAssert(app.navigationBars["Home"].exists)//Test Success
     
    
     
        
    }
    
    
    

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    
    
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
