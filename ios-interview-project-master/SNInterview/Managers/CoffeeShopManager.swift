//
//  CoffeeShopManager.swift
//  SNInterview
//
//  Created by Madhavan Murrali on 2/2/20.
//  Copyright © 2020 ServiceNow. All rights reserved.
//

import UIKit


/// The Manager class which manges communication between our View Model and the backend. This makes appropriate communication to get the data and send it back to our View Model. It can also the extended to call our remote server in the future.
class CoffeeShopManager {
    
    /// I designed this class to be Singleton, as our manager class will be used across our app and it manages State and also  has helper methods which can be used throughout
    static let shared = CoffeeShopManager()
    private init() {}
    
    /// Get the list of coffee shops from the CoffeeShops.json
    /// - Parameter completed: Result type which has List of Coffee Shops On Success and Error in case of any failure..
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
