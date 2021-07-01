//
//  databaseManager.swift
//  coreDataPractice
//
//  Created by minal borole on 01/07/21.
//

import Foundation
import CoreData
import UIKit

class databaseManager{
    static let shared = databaseManager()
    var todoArr: [Todo] = []
    
    private init(){
        
    }
    
    func getContext() -> NSManagedObjectContext?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return nil}
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    
    func saveTodo(title: String){
        let entity = NSEntityDescription.entity(forEntityName: "Todo", in: getContext()!)
        let todo = NSManagedObject(entity: entity!, insertInto: getContext()!)
        todo.setValue(title, forKey: "title")
        do{
            try getContext()?.save()
        }catch{
            print("something went wrong")
        }
    }
    
    func getTodo(){
        let request = NSFetchRequest<Todo>(entityName: "Todo")
        do{
            let result = try getContext()?.fetch(request)
            todoArr.removeAll()
            for todo in result!{
                todoArr.append(todo)
                
            }
        }catch{
            print("something went wrong")
        }
        
    }
}
