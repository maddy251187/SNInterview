//
//  CoffeeShopViewModel.swift
//  SNInterview
//
//  Created by Madhavan Murrali on 2/2/20.
//  Copyright © 2020 ServiceNow. All rights reserved.
//

import UIKit


class CoffeeShopViewModel {
    
    lazy var reviews = [CoffeeShop]()
    var reloadData: (() -> Void)?

    func getReviews() {
        CoffeeShopManager.shared.getReviews { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let reviews):
                self.reviews = reviews
                self.reloadData?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getReview(for index: Int) -> CoffeeShop {
        return self.reviews[index]
    }
    
}
