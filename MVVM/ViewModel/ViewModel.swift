//
//  ViewModel.swift
//  MVVM
//
//  Created by Payal Gupta on 25/10/18.
//  Copyright © 2018 Payal Gupta. All rights reserved.
//

import Foundation

class ViewModel {
    var todos: [Model]?
    
    func loadTODOs(at urlString: String, handler: ((Error?)->())?)   {
        NetworkingHandler.fetchData(at: urlString) {[weak self] (response, error) in
            self?.todos = response as? [Model]
            handler?(error)
        }
    }
}

// MARK: - Methods for tableView's dataSource
extension ViewModel {
    var todosTitle: String {
        return "Number of TODOs: \(self.numberOfTodos)"
    }
    
    var numberOfTodos: Int {
        return self.todos?.count ?? 0
    }
    
    func todo(at index: Int) -> Model? {
        return self.todos?[index]
    }
}
