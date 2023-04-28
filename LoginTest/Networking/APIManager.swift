//
//  APIManager.swift
//  LoginTest
//
//  Created by Jorge Vasquez on 26/01/2023.
//

import Foundation
import Alamofire

typealias resultCallback = (Result<Decodable, Error>) -> Void


class APIManager {
    
    
    
    func request<T: Encodable, Q: Decodable>(container: URLCall, userParameters: T, responseModel: Q.Type, callback: @escaping resultCallback) {
        var headers: HTTPHeaders {
                let loginHeaders: HTTPHeaders = [
                    .contentType("application/json")
                ]
                return loginHeaders
            
        }
        
        AF.request(container.baseUrl, method: container.method, parameters: userParameters, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            debugPrint(response)
            switch response.result {
            
            case .success(let responseData):
                guard let jsonData = responseData else {
                    return
                }
                
                let statusCode = response.response?.statusCode ?? -1
                
                do {
                    let decoder = JSONDecoder()
                    guard 200..<300 ~= statusCode else {
                        print(container.baseUrl)
                        let errorModel = try decoder.decode(ErrorBody.self, from: jsonData)
                        callback(Result.failure(errorModel))
                        return
                    }
                    
                    let responseModel = try decoder.decode(responseModel.self, from: jsonData)
                    callback(.success(responseModel))
                } catch {
                    callback(.failure(error))
                }
                
            
            case .failure(let error):
                print(error)
            }
        }
    }
}
