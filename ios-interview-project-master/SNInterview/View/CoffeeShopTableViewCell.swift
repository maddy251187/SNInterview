//
//  CoffeeShopItemView.swift
//  SNInterview
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import UIKit


/// The Custom cell for the shwoing the coffee shop details. Renamed CoffeeShopItemView to CoffeeShopTableViewCell as it gives more readibility and understanding that its a table view cell.
class CoffeeShopTableViewCell: UITableViewCell {
        
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    static let reuseIdentifier = "CoffeeShopCell"

    func set(shop: CoffeeShop) {
        nameLabel.text = shop.name
        reviewLabel.text = shop.review
        ratingLabel.text = "\(shop.rating) Stars"
    }
}
