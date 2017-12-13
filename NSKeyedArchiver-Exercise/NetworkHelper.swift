//
//  NetworkHelper.swift
//  NSKeyedArchiver-Exercise
//
//  Created by C4Q on 12/12/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import Foundation

class NetworkHelper {
    private init() {}
    static let manager = NetworkHelper()
    let session = URLSession(configuration: .default)
    func performDataTask(with url: URL, completionHandler: @escaping (Data) -> Void, errorHandler: @escaping (Error) -> Void) {
        session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error as? NSError {
                    if error.domain == NSURLErrorDomain && error.code == NSURLErrorNotConnectedToInternet {
                        errorHandler(AppError.noInternetConnection)
                    }
                    
                    errorHandler(AppError.other(rawError: error))
                    
                    return
                }
                
                if let response = response as? HTTPURLResponse {
                    if response.statusCode != 200 {
                        
                        errorHandler(AppError.badResponseCode(code: response.statusCode))
                        
                        return
                    }
                }
                
                if let data = data {
                    completionHandler(data)
                }
            }
        }.resume()
    }
}
