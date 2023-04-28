//
//  User.swift
//  LoginTest
//
//  Created by Jorge Vasquez on 16/01/2023.
//

import Foundation

protocol UserInfo {
    var email: String? {get set}
    var password: String? {get set}
}


struct User: UserInfo, Codable {
    
    var email: String?
    var password: String?
    
    
    enum CodingKeys: String, CodingKey {
        
        case email = "login"
        case password
        
    }
}

struct NewUser: UserInfo, Codable {
    
    var email: String?
    var password: String?
    
}
