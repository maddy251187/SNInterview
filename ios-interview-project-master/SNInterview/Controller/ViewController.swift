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
    
    fileprivate func configureTableView() {
        self.coffeeTableView.delegate = self
        self.coffeeTableView.dataSource = self
        self.coffeeTableView.register(UINib(nibName:"CoffeeShopTableViewCell", bundle: nil), forCellReuseIdentifier: CoffeeShopTableViewCell.reuseIdentifier)
        
    }
    
    fileprivate func getReviews() {
        self.coffeeShopViewModel.getReviews()
    }
    
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
        return coffeeShopViewModel.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let coffeeCell = tableView.dequeueReusableCell(withIdentifier: CoffeeShopTableViewCell.reuseIdentifier) as? CoffeeShopTableViewCell else {
            return UITableViewCell()
        }
        let coffeeShop = coffeeShopViewModel.getReview(for: indexPath.row)
        coffeeCell.set(shop: coffeeShop)
        return coffeeCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
