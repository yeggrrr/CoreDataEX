//
//  Yegr+CoreDataProperties.swift
//  CoreDataEX
//
//  Created by YJ on 12/13/24.
//
//

import Foundation
import CoreData


extension Yegr {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Yegr> {
        return NSFetchRequest<Yegr>(entityName: "Yegr")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var gender: String?

}

extension Yegr : Identifiable {

}
