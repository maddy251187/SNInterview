//
//  CoffeeShopViewModel.swift
//  SNInterview
//
//  Created by Madhavan Murrali on 2/2/20.
//  Copyright © 2020 ServiceNow. All rights reserved.
//

import UIKit


/// The View Model makes sure it keeps the view updated of the changes in the model and the model is upto date with the view.
class CoffeeShopViewModel {
    
    private lazy var reviews = [CoffeeShop]()
    var reloadData: (() -> Void)?
    
    /// Get the reviews from the Manager and updates its internal property
    func getReviews() {
        CoffeeShopManager.shared.getReviews { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let reviews):
                self.reviews = reviews
                // update the view with the changes..
                self.reloadData?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    /// Gets the review for the specified index
    /// - Parameter index: Index requested.
    func getReview(for index: Int) -> CoffeeShop {
        return self.reviews[index]
    }
    
    /// Get the count of reviews..
    func getReviewCount() -> Int {
        return self.reviews.count
    }
    
}
