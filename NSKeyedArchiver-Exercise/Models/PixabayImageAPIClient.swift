//
//  PixabayImageAPIClient.swift
//  NSKeyedArchiver-Exercise
//
//  Created by C4Q on 12/12/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import Foundation

class PixabayImageAPIClient {
    private init() {}
    static let manager = PixabayImageAPIClient()
    func getImages(from urlString: String, completionHandler: @escaping ([Image]) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlString) else {
            errorHandler(AppError.badURL(url: urlString))
            
            return
        }
        
        NetworkHelper.manager.performDataTask(
            with: url,
            completionHandler: { (data) in
                do {
                    guard let jsonDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {
                        print("could not get jsonDict")
                        return
                    }
                    
                    guard let imageDictArray = jsonDict["hits"] as? [[String : Any]] else {
                        print("Could not get imageDictArray")
                        
                        return
                    }
                    
                    var images: [Image] = []
                    
                    for imageDict in imageDictArray {
                        if let image = Image(from: imageDict) {
                            images.append(image)
                        }
                    }
                    
                    completionHandler(images)
                    
                } catch let error {
                    errorHandler(AppError.cannotParseJSON(rawError: error))
                }
        },
            errorHandler: errorHandler)
    }
}
