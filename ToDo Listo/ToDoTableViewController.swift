//
//  ToDoTableViewController.swift
//  ToDo Listo
//
//  Created by Andres Felipe De La Ossa Navarro on 10/16/18.
//  Copyright © 2018 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
   var toDos = [ToDo]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    func getToDos() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
            .viewContext {
            if let toDosFromCoreData = try? context.fetch(ToDo.fetchRequest()){
                if let toDoss = toDosFromCoreData as? [ToDo] {
                    toDos = toDoss
                    tableView.reloadData()
                    appDelegate.saveContext()
                }
            }
        }
    }

// HOW MANNY

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return toDos.count
    }

// WHATS INSIDE
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let currentToDo = toDos[indexPath.row]
        if currentToDo.important == true {
//            !!!
            if let name = currentToDo.name {
            cell.textLabel?.text = name + "❗️❗️"
            }
        }else {
        cell.textLabel?.text = currentToDo.name
        }
        return cell
    }
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedToDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: selectedToDo)
    }
//    PREPARE FOR SEGUE ADD
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController {
            addVC.toDoTableVC = self
        }
        if let completeVC = segue.destination as? ToDoViewController {
            if let selectedToDo = sender as? ToDo {
            completeVC.todo = selectedToDo
            }
        }
    }

}
