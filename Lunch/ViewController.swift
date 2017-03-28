//
//  ViewController.swift
//  Lunch
//
//  Created by Julianny Favinha on 3/23/17.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit

/// Class that controls the interactions between user and app.
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CheckDisplay {
    // info (icon, name and price) of available meals
    fileprivate let items: [Meal] = [Meal(symbol: "🍔", name: "hamburguer", price: 2.0),
                                     Meal(symbol: "🍦", name: "ice cream", price: 0.5),
                                     Meal(symbol: "🍕", name: "pizza", price: 1.0),
                                     Meal(symbol: "🍜", name: "noodles", price: 5.0),
                                     Meal(symbol: "🍗", name: "chicken", price: 4.5)]
    
    fileprivate var check: Check = Check()
    fileprivate var selectedItems: [Meal] = []
    
    @IBOutlet weak var removeAllButton: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.check.delegate = self
        self.removeAllButton.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func display(total: Float) {
        self.totalLabel.text = "\(selectedItems.count) items - Total: $\(total)"
    }
    
    /// Action triggered when a user clicks in a meal button
    ///
    /// - Parameter sender: button pressed
    @IBAction func mealPressed(_ sender: UIButton) {
        // show button removeAll
        self.removeAllButton.isHidden = false
        
        // find meal that was pressed in items array to add it in selectedItems array
        for item in items {
            if (item.symbol == Character(sender.currentTitle!)) {
                selectedItems.append(Meal(symbol: item.symbol, name: item.name, price: item.price))
                break
            }
        }
        
        self.tableView.reloadData()
        self.check.setTotalValue(selectedItems: selectedItems)
    }
    
    /// Action triggered when a user clicks in "Remove all" button
    /// Clear the array selectedItems and update tableView
    ///
    /// - Parameter sender: button pressed
    @IBAction func removeAllPressed(_ sender: UIButton) {
        // hide removeAll button cause there's no one meal in check
        self.removeAllButton.isHidden = true
        
        self.selectedItems.removeAll()
        self.check.setTotalValue(selectedItems: selectedItems)
        self.tableView.reloadData()

    }
    
    /// Function used by a table view element, need to know the next position to add a cell
    ///
    /// - Parameters:
    ///   - tableView: table view object
    ///   - section: in this case, we use only 1 section
    /// - Returns: count of selectedItems array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedItems.count
    }
    
    /// Creates a cell for a table view
    ///
    /// - Parameters:
    ///   - tableView: table view object
    ///   - indexPath: index of cell to put in table view
    /// - Returns: a cell for table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MealCell
        let meal = selectedItems[indexPath.row]
        
        cell.icon.text = String(meal.symbol)
        cell.name.text = meal.name
        cell.price.text = String("$\(meal.price)")
        
        return cell
    }
    
    /// Function that implements a swipe for a cell in tableView. Swipe shows a delete option
    ///
    /// - Parameters:
    ///   - tableView: table view object
    ///   - editingStyle: edit mode (.delete)
    ///   - indexPath: index of cell to delete in table view
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // Activates the edition mode to the cell for delete
        // Removes the item in selectedItems and the cell in tableView and recalculates the check
        if editingStyle == .delete {
            selectedItems.remove(at: indexPath.row)
            self.check.setTotalValue(selectedItems: selectedItems)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        // if selectedItems is empty, hide removeAll button cause there's no one meal in table view
        if selectedItems.isEmpty {
            self.removeAllButton.isHidden = true
        }
        
        self.tableView.reloadData()
    }
}
