//
//  ViewController.swift
//  CoreDataEX
//
//  Created by YJ on 12/12/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    private let coreDataView = CoreDataView()
    var container: NSPersistentContainer!
    
    override func loadView() {
        view = coreDataView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configurePersistentContainer()
        // createEntity()
    }
    
    private func configureTableView() {
        coreDataView.tableView.delegate = self
        coreDataView.tableView.dataSource = self
        coreDataView.tableView.register(CoreDataCell.self, forCellReuseIdentifier: CoreDataCell.id)
    }
    
    private func configurePersistentContainer() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer
    }
    
    private func createEntity() {
        if let entity = NSEntityDescription.entity(forEntityName: "Yegr", in: self.container.viewContext) {
            let object = NSManagedObject(entity: entity, insertInto: self.container.viewContext)
            object.setValue("Fubao", forKey: "name")
            object.setValue("M", forKey: "gender")
            object.setValue(4, forKey: "age")
        }
        
        saveData()
    }
    
    private func saveData() {
        do {
            try self.container.viewContext.save()
        } catch {
            print("error!: \(error.localizedDescription)")
        }
    }
    
    private func fetchData() -> Int {
        do {
            let data = try self.container.viewContext.fetch(Yegr.fetchRequest())
            return data.count
        } catch {
            print("error!: \(error.localizedDescription)")
        }
        
        return 0
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoreDataCell.id, for: indexPath) as? CoreDataCell else { return UITableViewCell() }
        
        cell.nameLabel.text = "Fubao"
        cell.genderLabel.text = "M"
        cell.ageLabel.text = "4"
        
        return cell
    }
}
