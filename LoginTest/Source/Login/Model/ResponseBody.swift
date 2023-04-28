//
//  ResponseBody.swift
//  LoginTest
//
//  Created by Jorge Vasquez on 16/01/2023.
//

import Foundation

struct Response: Codable {
    var lastLogin: Date?
    var userStatus: String?
    var createdAt: Int?
    var accountType: String?
    var ownerId: String?
    var socialAccount: String?
    var userToken: String?
    var objectId: String?
    var email: String?
    
    enum CodingKeys: String, CodingKey {
    
        case lastLogin
        case userStatus
        case createdAt = "created"
        case accountType
        case ownerId
        case socialAccount
        case userToken = "user-token"
        case objectId
        case email
      
    }
}
