//
//  MealCell.swift
//  Lunch
//
//  Created by Julianny Favinha on 3/24/17.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit

/// Class for cells used in TableView.
/// A cell contains 3 elements that describes a meal: an icon (unicode character), a name and a price
class MealCell: UITableViewCell {

    @IBOutlet weak var icon: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
