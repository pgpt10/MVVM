//
//  CollectionViewCell.swift
//  MVVM
//
//  Created by Payal Gupta on 25/10/18.
//  Copyright © 2018 Payal Gupta. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    //MARK: Outlets
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    
    //MARK: Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //MARK: Internal Methods
    func configure(with todo: Model)  {
        self.idLabel.text = "\(todo.id ?? -1)"
        self.titleLabel.text = todo.title
        self.completedLabel.text = "\(todo.completed ?? false)"
    }
}
