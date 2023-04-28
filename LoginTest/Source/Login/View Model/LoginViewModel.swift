//
//  LoginViewModel.swift
//  LoginTest
//
//  Created by Jorge Vasquez on 16/01/2023.
//

import Foundation

protocol AlertSetter {
    func requestServiceError (errorMessage: String)
    func requestServiceSuccess (userData: Response)
}
class loginViewModel {
    
    let shared = APIManager()
    var delegate: AlertSetter?
    
    func requestService<V: Codable>(target: V, call: URLCall)  {
        shared.request(container: call, userParameters: target, responseModel: Response.self) { result in
            
            switch result {
            case .success(let responseData):
                let data = responseData as! Response
                self.delegate?.requestServiceSuccess(userData: data)
                
                
            case .failure(let error):
                let errorData = error as? ErrorBody
                print("\(errorData?.message ?? "Unknown error found")")
                self.delegate?.requestServiceError(errorMessage: errorData?.message ?? "Unknown error found")
            }
            
//            print(result)
            
            
            
        }
        
    }
    
}




