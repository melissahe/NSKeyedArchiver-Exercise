//
//  AppError.swift
//  NSKeyedArchiver-Exercise
//
//  Created by C4Q on 12/12/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import Foundation

enum AppError: Error {
    case badData
    case badImageURL(url: String)
    case badResponseCode(code: Int)
    case badURL(url: String)
    case cannotParseJSON(rawError: Error)
    case noInternetConnection
    case other(rawError: Error)
}
