//
//  TableViewCell.swift
//  MVVM
//
//  Created by Payal Gupta on 25/10/18.
//  Copyright © 2018 Payal Gupta. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    //MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Private Properties
    let controller = TableViewCellController()
    
    //MARK: Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        self.collectionView.dataSource = self.controller
        self.collectionView.delegate = self.controller
    }
    
    //MARK: Internal Methods
    func configure(with todos: [Model]) {
        self.controller.viewModel.todos = todos
        self.collectionView.reloadData()
    }
}
