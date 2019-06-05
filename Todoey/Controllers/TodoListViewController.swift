//
//  ViewController.swift
//  Todoey
//
//  Created by Nene Wang  on 6/4/19.
//  Copyright © 2019 Nene Wang . All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    let defaults = UserDefaults.standard
    
    var itemArray = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem3 = Item()
        newItem3.title = "Find Mi2ke"
        itemArray.append(newItem3)
        //addButtomPressed( )
        
        // Do any additional setup after loading the view.
        
//        if let items =  defaults.array(forKey: "TodoListArray") as? [Item]{
//            itemArray = items
//        }
        tableView.reloadData()


    }
    
    //Mark  - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    cell.textLabel?.text = itemArray[indexPath.row].title
       
        let item = itemArray[indexPath.row]
        cell.accessoryType = item.done ? .checkmark : .none
//
//        if itemArray[indexPath.row].done == true{
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
//
        return cell
    
    }
    
    //Table Views Delegate
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
   
        
        
        tableView.reloadData()
        
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
            
            let newItem = Item()
            newItem.title = textField.text!
           // newItem.done = false
            
            
          //  newItem.title = "Find Mike"
             self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
           
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

