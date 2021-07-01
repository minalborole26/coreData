//
//  addTodoViewController.swift
//  coreDataPractice
//
//  Created by minal borole on 01/07/21.
//

import UIKit

class addTodoViewController: UIViewController {

    @IBOutlet weak var todoTF: UITextField!
    
    @IBOutlet weak var saveBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onTabSaveBtn(_ sender: UIButton) {
        databaseManager.shared.saveTodo(title: todoTF.text!)
        navigationController?.popViewController(animated: true)
    }
    

}
