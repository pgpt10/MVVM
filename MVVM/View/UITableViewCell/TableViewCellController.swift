//
//  TableViewCellController.swift
//  MVVM
//
//  Created by Payal Gupta on 25/10/18.
//  Copyright © 2018 Payal Gupta. All rights reserved.
//

import UIKit

class TableViewCellController: NSObject {
    let viewModel = TableViewCellViewModel()
}

// MARK: - UICollectionViewDataSource Methods
extension TableViewCellController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfTodos
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        if let todo = self.viewModel.todo(at: indexPath.row) {
            cell.configure(with: todo)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate Methods
extension TableViewCellController: UICollectionViewDelegate {
    //TODO:
}
