//
//  LoginService.swift
//  LoginTest
//
//  Created by Jorge Vasquez on 16/01/2023.
//

import Foundation

enum LoginService {
    
    case login
    case register(newUser: NewUser)
}

extension LoginService {
    var baseUrl: String {
        switch self {
        case .login: return "http://turgentberry.backendless.app/api/users/register"
        case .register: return "http://turgentberry.backendless.app/api/users/register"
        }
    }
    
    var method: String {
        switch self {
        case .login, .register: return "POST"
        }
    }
    
    

}
