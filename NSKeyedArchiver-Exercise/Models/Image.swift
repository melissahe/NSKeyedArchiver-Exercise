//
//  Image.swift
//  NSKeyedArchiver-Exercise
//
//  Created by C4Q on 12/12/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import Foundation

final class Image: NSObject, NSCoding {
    
    enum ImagePropertyKeys: String {
        case numberOfLikes, numberOfFavorites, tags, numberOfViews, numberOfDownloads, userName, thumbnailURL, hdURL
    }
    
    let numberOfLikes: Int
    let numberOfFavorites: Int
    let tags: String
    let numberOfViews: Int
    let numberOfDownloads: Int
    let userName: String
    let thumbnailURL: String
    let hdURL: String
    
    //associates each property with a given key
    func encode(with aCoder: NSCoder) {
        aCoder.encode(numberOfLikes, forKey: ImagePropertyKeys.numberOfLikes.rawValue)
        
        aCoder.encode(numberOfFavorites, forKey: ImagePropertyKeys.numberOfFavorites.rawValue)
        
        aCoder.encode(tags, forKey: ImagePropertyKeys.tags.rawValue)
        
        aCoder.encode(numberOfViews, forKey: ImagePropertyKeys.numberOfViews.rawValue)
        
        aCoder.encode(numberOfDownloads, forKey: ImagePropertyKeys.numberOfDownloads.rawValue)
    
        aCoder.encode(userName, forKey: ImagePropertyKeys.userName.rawValue)
        
        aCoder.encode(thumbnailURL, forKey: ImagePropertyKeys.thumbnailURL.rawValue)
        
        aCoder.encode(hdURL, forKey: ImagePropertyKeys.hdURL.rawValue)
        
    }
    
    convenience init?(coder aDecoder: NSCoder) {
        
        guard
            let numberOfLikes = aDecoder.decodeObject(forKey: ImagePropertyKeys.numberOfLikes.rawValue) as? Int,
            let numberOfFavorites = aDecoder.decodeObject(forKey: ImagePropertyKeys.numberOfFavorites.rawValue) as? Int,
            let tags = aDecoder.decodeObject(forKey: ImagePropertyKeys.tags.rawValue) as? String,
            let numberOfViews = aDecoder.decodeObject(forKey: ImagePropertyKeys.numberOfViews.rawValue) as? Int,
            let numberOfDownloads = aDecoder.decodeObject(forKey: ImagePropertyKeys.numberOfDownloads.rawValue) as? Int,
            let userName = aDecoder.decodeObject(forKey: ImagePropertyKeys.userName.rawValue) as? String,
            let thumbnailURL = aDecoder.decodeObject(forKey: ImagePropertyKeys.thumbnailURL.rawValue) as? String,
            let hdURL = aDecoder.decodeObject(forKey: ImagePropertyKeys.hdURL.rawValue) as? String
        else {
            return nil
        }
        
        self.init(numberOfLikes: numberOfLikes, numberOfFavorites: numberOfFavorites, tags: tags, numberOfViews: numberOfViews, numberOfDownloads: numberOfDownloads, userName: userName, thumbnailURL: thumbnailURL, hdURL: hdURL)
    }
    
    init(numberOfLikes: Int, numberOfFavorites: Int, tags: String, numberOfViews: Int, numberOfDownloads: Int, userName: String, thumbnailURL: String, hdURL: String) {
        self.numberOfLikes = numberOfLikes
        self.numberOfFavorites = numberOfFavorites
        self.tags = tags
        self.numberOfViews = numberOfViews
        self.numberOfDownloads = numberOfDownloads
        self.userName = userName
        self.thumbnailURL = thumbnailURL
        self.hdURL = hdURL
    }
    
}
