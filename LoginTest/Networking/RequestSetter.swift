//
//  URLSetter.swift
//  LoginTest
//
//  Created by Jorge Vasquez on 26/01/2023.
//

import Foundation
import Alamofire


protocol URLSetter {

    var baseUrl: String {get}
    var operation: String {get}
    var method: HTTPMethod {get}
}
extension URLSetter {
    
    var baseUrl: String {
        return "https://creamystore.backendless.app/api/users/\(operation)"
    }
}

enum URLCall {
    case register
    case login
    case logout
}

extension URLCall: URLSetter {
    var method: HTTPMethod {
        switch self {
        case .register, .login:
            return .post
        case .logout:
            return .get
        }
    
    }
    
    var operation: String {
        switch self {
        case .register:
            return "register"
        case .login:
            return "login"
        case .logout:
            return "logout"
        }
    }
    
}

