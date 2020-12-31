//
//  MockLoginService.swift
//  LoginCombineMVVMTests
//
//  Created by Knoxpo MacBook Pro on 31/12/20.
//  Copyright © 2020 Atif. All rights reserved.
//

import Foundation
@testable import LoginCombineMVVM
class MockLoginService: LoginService
{
    var result: Result<User,LoginError>?
    func login(_ completion: @escaping (Result<User, LoginError>) -> Void) {
        if let result = result{
            completion(result)
            
        }
    }
    
    
    
}
