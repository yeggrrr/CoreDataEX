//
//  CoreDataManager.swift
//  CoreDataEX
//
//  Created by YJ on 12/13/24.
//

import UIKit
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() { }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Yegr")
        return container
    }()
}
