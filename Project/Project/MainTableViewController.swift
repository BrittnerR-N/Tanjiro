//
//  ViewController.swift
//  Pet-project
//
//  Created by Никита Тюрин on 31.07.23.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private let tableViewCell = MainTableViewCell()
    private let identifierCell = "cell"
    var objects = [Element(flag: "🇺🇦", name: "Ukraine", isFavourite: false),
                   Element(flag: "🇺🇸", name: "USA", isFavourite: false),
                   Element(flag: "🇩🇪", name: "Deutsch", isFavourite: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSourceNdelegate()
        addSubViews()
        didSetConstraints()
    }
    
    func dataSourceNdelegate() {
        view.backgroundColor = #colorLiteral(red: 0.5838261247, green: 0.6520275474, blue: 0.9142135978, alpha: 1)
        title = "Country"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: identifierCell)
    }
    
    func addSubViews() {
        view.addSubview(tableViewCell)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let like = favouriteAction(at: indexPath)
        let done = doneAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [done, like])
    }
    
    func doneAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Done") { (action, view, completion) in
            self.objects.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.backgroundColor = .systemGreen
        action.image = UIImage(systemName: "checkmark.circle")
        return action
    }
    
    func favouriteAction( at indexPath: IndexPath) -> UIContextualAction {
        var object = objects[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Like") { (action, view, completion) in
            object.isFavourite = !object.isFavourite
            self.objects[indexPath.row] = object
            completion(true)
        }
        action.backgroundColor = object.isFavourite ? .systemPink : .systemGray
        action.image = UIImage(systemName: "heart")
        return action
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell) as! MainTableViewCell
        let object = objects[indexPath.row]
        cell.setUI(object: object)
        return cell
    }
    
    func didSetConstraints() {
        NSLayoutConstraint.activate([
            tableViewCell.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewCell.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewCell.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

