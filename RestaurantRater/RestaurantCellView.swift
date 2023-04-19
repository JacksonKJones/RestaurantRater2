//
//  RestaurantCellView.swift
//  RestaurantRater
//
//  Created by User 2 on 4/10/23.
//

import UIKit

class RestaurantCellView: UITableViewCell {
    
    
    @IBOutlet weak var restName: UILabel!
    @IBOutlet weak var restItem: UILabel!
    @IBOutlet weak var restMeal: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
