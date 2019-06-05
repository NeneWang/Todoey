//
//  ViewController.swift
//  Todoey
//
//  Created by Nene Wang  on 6/4/19.
//  Copyright © 2019 Nene Wang . All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    var itemArray = ["find MIke", "Buy Eggos", "Destory Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Mark  - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    
    }
    
    //Table Views Delegate
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        if(tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK -Add New Items
    @IBAction func addButtomPressed(_ sender: Any) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle:  .alert)
        let action = UIAlertAction(title:"Add Item", style: .default){
            (action) in
            
            //itemArray.append(textField.text!)
            print(textField.text!)
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        alert.addTextField { (UITextField) in
            UITextField.placeholder = "Create new item"
           textField = UITextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
}

