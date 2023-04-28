//
//  ErrorHandling.swift
//  LoginTest
//
//  Created by Jorge Vasquez on 31/01/2023.
//

import Foundation

protocol ErrorHandling {
  func showErrorAlert(message: String)
}

struct ErrorBody: Codable, Error {
    var code: Int?
    var message: String?
    
}

