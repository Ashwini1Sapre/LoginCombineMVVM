//
//  LoginCombineMVVMTests.swift
//  LoginCombineMVVMTests
//
//  Created by Knoxpo MacBook Pro on 31/12/20.
//  Copyright © 2020 Atif. All rights reserved.
//

import XCTest
import Combine
@testable import LoginCombineMVVM
class LoginCombineMVVMTests: XCTestCase {

   // var sut: LoginViewModel!
    
    var viewmodel: LoginFormViewModel!
    var viewmock: MockLoginService!
   
  
   
 
    

    
    override func setUp() {
        viewmock = MockLoginService()
        viewmodel = LoginFormViewModel(loginService: viewmock )
       
    }
    
    
    
    override func tearDown() {
        
      viewmock = nil
        viewmodel = nil
    }
    
    
    func testEmptyLoginFormThrowsError() {
        XCTAssertNil(viewmodel.username)
        XCTAssertNil(viewmodel.password)

      // 1
      let testExpectation = expectation(description: "Expected login completion handler to be called")
        
        
        viewmodel.login { result in
            guard case let .failure(error) = result, case error = LoginError.formIsEmpty else{
               XCTFail("expected completion callled from empty")
                testExpectation.fulfill()
               return
         
        }
       
        testExpectation.fulfill()
    
    }
        waitForExpectations(timeout: 1, handler: nil)
    
    }
    
    
    func testvalidefortestcreditential(){
        
        viewmodel.username = "ABC@gmail.com"
        viewmodel.password = "12345"
        XCTAssertNotNil(viewmodel.username)
        XCTAssertNotNil(viewmodel.password)
        viewmock.result = .success(User())
        
        
        let expection = expectation(description: "test for static value")
        
        viewmodel.login { result in
            guard case let .success(User) = result else {
                XCTFail("pass static feild")
                expection.fulfill()
                return
            }
            expection.fulfill()
            
        }
       
        wait(for: [expection], timeout: 1)
    }
    
    func testValidTestforFauiler()
    {
        
        viewmodel.username = "test@gmil.com"
        viewmodel.password = "password"
        XCTAssertNotNil(viewmodel.username)
        XCTAssertNotNil(viewmodel.password)
        viewmock.result = .failure(LoginError.incorrectCredentials)
        let expectetion = expectation(description: "to check failuer")
        viewmodel.login { result in
            guard case let .failure(error) = result, case error = LoginError.incorrectCredentials else
            {
                XCTFail("to show error")
                expectetion.fulfill()
                
                return
            }
            expectetion.fulfill()
            
        }
        wait(for: [expectetion], timeout: 1)
        
        
    
        
    }
    
    func testValidTestfoeviewmodel()
    {
        
        
       // sut.email = "ti@gmail.com"
      //  sut.password = "12345"
      
     
        
       // return hand.filter({ ($0 as Card).type == .Red })
        
    }
    
    
    
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}


//XCTAssert(app.navigationBars["Home"].exists)
