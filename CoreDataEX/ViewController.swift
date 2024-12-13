//
//  ViewController.swift
//  CoreDataEX
//
//  Created by YJ on 12/12/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var container: NSPersistentContainer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePersistentContainer()
        // getEntity()
        fetchData()
    }
    
    func configurePersistentContainer() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer
    }
    
    func getEntity() {
        if let entity = NSEntityDescription.entity(forEntityName: "Yegr", in: self.container.viewContext) {
            let object = NSManagedObject(entity: entity, insertInto: self.container.viewContext)
            object.setValue("Fubao", forKey: "name")
            object.setValue("M", forKey: "gender")
            object.setValue(4, forKey: "age")
        }
        
        saveData()
    }
    
    func saveData() {
        do {
            try self.container.viewContext.save()
        } catch {
            print("error!: \(error.localizedDescription)")
        }
    }
    
    func fetchData() {
        do {
            let data = try self.container.viewContext.fetch(Yegr.fetchRequest()) as! [Yegr]
            data.forEach {
                print($0.name)
                print($0.gender)
                print($0.age)
            }
        } catch {
            print("error!: \(error.localizedDescription)")
        }
    }
}
