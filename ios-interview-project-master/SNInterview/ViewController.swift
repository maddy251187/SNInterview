//
//  ViewController.swift
//  SNInterview
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import UIKit

protocol CoffeeShopTapDelegate {
    func didSelectItem(_ item: UIView?)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var coffeeTableView: UITableView!
    var delegate: CoffeeShopTapDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        self.getCoffeeShops()
    }
    
    @objc func onTap(item: UIView) {
        delegate.didSelectItem(nil)
    }
    
    func configureTableView() {
        self.coffeeTableView.delegate = self
        self.coffeeTableView.dataSource = self
        self.coffeeTableView.register(UINib(nibName:"CoffeeShopTableViewCell", bundle: nil), forCellReuseIdentifier: CoffeeShopTableViewCell.reuseIdentifier)
        
    }
    fileprivate func getCoffeeShops() {
           reviews.forEach { [weak self] coffeeShop in
               // added weak closure to avoid memory leaks.
               guard let self = self else { return }
               self.coffeeTableView.reloadData()
           }
       }

    private let reviews = [
          CoffeeShop(name:"Lofty", review: "Knowledgeable staff, stacked menu. Trust the Ethiopian in a pour over if you know your flavors. Will be back for the rest of this menu soon.", rating: 4),
          CoffeeShop(name:"Zumbar", review: "Came to SD for school tour and heading back to the Bay Area after today's final meeting. Was drinking Starbucks the whole trip until my sis recommended this cafe to me. LOVE IT!", rating: 5),
          CoffeeShop(name:"Blue Bottle", review: "The place was empty the afternoon I came in, so I was able to quickly place an order for their version of a New Orleans cold brew. I received my drink right as my credit card order went through.", rating: 3),
          CoffeeShop(name:"Bird Rock", review: "When it comes to environment and ambience, this place is amazing! It has a cute lil look, yet looks a bit modern. It's very eye appealing and I would definitely deem Instagramable.", rating: 3),
          CoffeeShop(name:"Better Buzz Coffee", review: "This coffee shop is really cute. The decor is beautiful, food and coffee is tasty and the service is friendly and quick.", rating: 5)
      ]
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let coffeeCell = tableView.dequeueReusableCell(withIdentifier: CoffeeShopTableViewCell.reuseIdentifier) as? CoffeeShopTableViewCell else {
            return UITableViewCell()
        }
        let coffeeShop = reviews[indexPath.row]
        coffeeCell.set(shop: coffeeShop)
        return coffeeCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
