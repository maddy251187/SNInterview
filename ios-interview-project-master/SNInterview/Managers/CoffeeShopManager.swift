//
//  CoffeeShopManager.swift
//  SNInterview
//
//  Created by Madhavan Murrali on 2/2/20.
//  Copyright © 2020 ServiceNow. All rights reserved.
//

import UIKit


class CoffeeShopManager {
    
    static let shared = CoffeeShopManager()
    private init() {}
    
    func getReviews(completed: @escaping (Result<[CoffeeShop], Error>) -> Void) {
        if let url = Bundle.main.url(forResource: "CoffeeShops", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let coffeeShops: [CoffeeShop] = try decoder.decode([CoffeeShop].self, from: data)
                completed(.success(coffeeShops))
            } catch {
                completed(.failure(error))
            }
        }
    }
}
