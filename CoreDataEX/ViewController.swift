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
        configureAction()
        fetchData()
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
    
    private func createEntity(name: String, gender: String, age: Int) {
        if let entity = NSEntityDescription.entity(forEntityName: "Yegr", in: self.container.viewContext) {
            let object = NSManagedObject(entity: entity, insertInto: self.container.viewContext)
            object.setValue(name, forKey: "name")
            object.setValue(gender, forKey: "gender")
            object.setValue(age, forKey: "age")
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
    
    private func fetchData() -> [Yegr]? {
        do {
            let data = try self.container.viewContext.fetch(Yegr.fetchRequest())
            return data
        } catch {
            print("error!: \(error.localizedDescription)")
        }
        
        return nil
    }
    
    private func configureAction() {
        coreDataView.saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
    }
    
    @objc func saveButtonClicked() {
        createEntity(
            name: coreDataView.nameTextField.text ?? "",
            gender: coreDataView.genderTextField.text ?? "",
            age: Int(coreDataView.ageTextField.text ?? "") ?? 0
        )
        
        coreDataView.tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataCount = fetchData()?.count else { return 0 }
        return dataCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoreDataCell.id, for: indexPath) as? CoreDataCell else { return UITableViewCell() }
        
        if let data = fetchData() {
            cell.nameLabel.text = data[indexPath.row].name
            cell.genderLabel.text = data[indexPath.row].gender
            cell.ageLabel.text = "\(data[indexPath.row].age)"
        }
        
        return cell
    }
}
