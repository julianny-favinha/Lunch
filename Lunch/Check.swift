//
//  Check.swift
//  Lunch
//
//  Created by Julianny Favinha on 3/23/17.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit

protocol CheckDisplay: NSObjectProtocol {
    func display(total: Float)
}

/// Calculate and show the check
class Check: NSObject {
    public private(set) var total: Float
    
    public weak var delegate: CheckDisplay?
    
    public override init() {
        self.total = Float()
    }
    
    /// Display the check
    fileprivate func displayTotal() {
        if let delegate = self.delegate {
            delegate.display(total: self.total)
        }
    }
    
    /// Sums the values of selected items
    ///
    /// - Parameter selectedItems: array of items selected by the user
    func setTotalValue(selectedItems: [Meal]) {
        self.total = 0.0
        
        for item in selectedItems {
            self.total += item.price
        }
        
        displayTotal()
    }
}
