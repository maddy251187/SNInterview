//
//  ViewController.swift
//  SNInterview
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var coffeeTableView: UITableView!
    internal lazy var coffeeShopViewModel = CoffeeShopViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initClosures()
        self.configureTableView()
        self.getReviews()
    }
    
    /// configures the table view which is going to display the cofee shop information.
    fileprivate func configureTableView() {
        self.coffeeTableView.delegate = self
        self.coffeeTableView.dataSource = self
        self.coffeeTableView.register(UINib(nibName:"CoffeeShopTableViewCell", bundle: nil), forCellReuseIdentifier: CoffeeShopTableViewCell.reuseIdentifier)
    }
    
    /// Gets reviews from the view model. I designed with MVVM architecture, so that our view oontrollers or views dont worry about updating the model being updated after every UI/UX change. View Model makes sure the model is updated after a change in the view and view is updated for any changes in the model.
    fileprivate func getReviews() {
        self.coffeeShopViewModel.getReviews()
    }
    
    /// initialize the closures to be used to update the data from the view model
    fileprivate func initClosures() {
        coffeeShopViewModel.reloadData = { [weak self] in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.coffeeTableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeShopViewModel.getReviewCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let coffeeCell = tableView.dequeueReusableCell(withIdentifier: CoffeeShopTableViewCell.reuseIdentifier) as? CoffeeShopTableViewCell else {
            return UITableViewCell()
        }
        let coffeeShop = coffeeShopViewModel.getReview(for: indexPath.row)
        coffeeCell.set(shop: coffeeShop)
        coffeeCell.accessoryType = .disclosureIndicator
        return coffeeCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coffeeShop = coffeeShopViewModel.getReview(for: indexPath.row)
        let reviewDetailVC = ReviewDetailViewController()
        reviewDetailVC.coffeeShop = coffeeShop
        self.navigationController?.pushViewController(reviewDetailVC, animated: true)
    }
    
}
