//
//  ViewController.swift
//  coreDataPractice
//
//  Created by minal borole on 01/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        databaseManager.shared.getTodo()
        todoTableView.reloadData()
    }

    @IBAction func onTabPlusBtn(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(identifier: "addTodoViewController") as! addTodoViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return databaseManager.shared.todoArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let todo = databaseManager.shared.todoArr[indexPath.row]
        cell?.textLabel?.text = todo.title
        
        return cell!
    }
    
    
}
