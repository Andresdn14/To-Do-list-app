//
//  AddToDoViewController.swift
//  ToDo Listo
//
//  Created by Andres Felipe De La Ossa Navarro on 10/17/18.
//  Copyright © 2018 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var addToDoLabel: UILabel!
    @IBOutlet weak var addToDoText: UITextField!
    @IBOutlet weak var addImportandLabel: UILabel!
    var toDoTableVC : ToDoTableViewController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addImportantSwitch(_ sender: Any) {

    }
    
    @IBAction func addToDoButton(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
            .viewContext {
            let newToDo = ToDo(context: context)
            newToDo.important = importantSwitch.isOn
            if let name = addToDoText.text {
                newToDo.name = name
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        let newToDo = ToDo()
        newToDo.important = importantSwitch.isOn
        if let name = addToDoText.text {
            newToDo.name = name
        }
        navigationController?.popViewController(animated: true)
    }
    

}
