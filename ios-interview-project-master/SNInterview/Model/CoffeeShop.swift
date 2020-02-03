//
//  CoffeeShop.swift
//  SNInterview
//
//  Created by Madhavan Murrali on 2/2/20.
//  Copyright © 2020 ServiceNow. All rights reserved.
//

import Foundation

/// Our Coffee Shop model which has properties like name, review and rating.
struct CoffeeShop: Codable {
    let name: String
    let review: String
    let rating: Int
}
