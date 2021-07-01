//
//  Todo+CoreDataProperties.swift
//  coreDataPractice
//
//  Created by minal borole on 01/07/21.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var title: String?

}

extension Todo : Identifiable {

}
