//
//  ReviewDetailViewController.swift
//  SNInterview
//
//  Created by Madhavan Murrali on 2/2/20.
//  Copyright © 2020 ServiceNow. All rights reserved.
//

import UIKit

class ReviewDetailViewController: UIViewController {
    
    var coffeeShop: CoffeeShop?
    var reviewLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureReviewLabel()
    }
    
    /// Configure the Review label to show the review...
    fileprivate func configureReviewLabel() {
        self.view.addSubview(reviewLabel)
        reviewLabel.numberOfLines = 10
        reviewLabel.contentMode = .topLeft
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        //
        NSLayoutConstraint.activate([
            reviewLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            reviewLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            reviewLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
        ])
    }
    
    /// Confgure the VC with coffee shop details.
    fileprivate func configureViewController() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.backBarButtonItem?.title = ""
        
        if let coffeeShop = coffeeShop {
            self.navigationItem.title = coffeeShop.name
            self.reviewLabel.text = coffeeShop.review
        }
        
        self.view.backgroundColor = .white
    }
}
