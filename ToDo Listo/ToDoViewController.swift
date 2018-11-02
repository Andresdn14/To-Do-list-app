//
//  ToDoViewController.swift
//  ToDo Listo
//
//  Created by Andres Felipe De La Ossa Navarro on 10/18/18.
//  Copyright © 2018 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController {
    @IBOutlet weak var NameLabel: UILabel!
    var todo = ToDo()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NameLabel.text = todo.name
    }
    
    @IBAction func completeButton(_ sender: Any) {
    }
    

}
