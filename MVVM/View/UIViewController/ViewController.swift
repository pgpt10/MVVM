//
//  ViewController.swift
//  MVVM
//
//  Created by Payal Gupta on 25/10/18.
//  Copyright © 2018 Payal Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Private Properties
    private let viewModel = ViewModel()
    private enum Constants {
        static let cellIdentifier = "TableViewCell"
        static let apiURL = "https://jsonplaceholder.typicode.com/todos"
    }
    
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.registerCells()
        self.viewModel.loadTODOs(at: Constants.apiURL) {[weak self] (error) in
            DispatchQueue.main.async {
                if error == nil {
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

// MARK: - Private Methods
private extension ViewController {
    func registerCells()  {
        self.tableView.register(UINib(nibName: Constants.cellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
    }
}

// MARK: - UITableViewDataSource Methods
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! TableViewCell
        cell.titleLabel.text = self.viewModel.todosTitle
        if let todos = self.viewModel.todos {
            cell.configure(with: todos)
        }
        return cell
    }
}

// MARK: - UITableViewDelegate Methods
extension ViewController: UITableViewDelegate {
    
}
