//
//  TableViewCellViewModel.swift
//  MVVM
//
//  Created by Payal Gupta on 25/10/18.
//  Copyright © 2018 Payal Gupta. All rights reserved.
//

import Foundation

class TableViewCellViewModel {
    var todos: [Model]?
}

extension TableViewCellViewModel {
    var numberOfTodos: Int {
        return todos?.count ?? 0
    }
    
    func todo(at index: Int) -> Model? {
        return todos?[index]
    }
}
