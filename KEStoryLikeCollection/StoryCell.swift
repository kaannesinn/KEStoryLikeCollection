//
//  StoryCell.swift
//  KEStoryLikeCollection
//
//  Created by Kaan Esin on 24.03.2020.
//  Copyright © 2020 Kaan Esin. All rights reserved.
//

import UIKit

class StoryCell: UICollectionViewCell {
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lblCell: UILabel!
    @IBOutlet weak var constraintYForImage: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCellImage(isImageCircle: Bool = true) {
        if isImageCircle {
            imgCell.layer.cornerRadius = imgCell.bounds.width / 2
            imgCell.layer.masksToBounds = true
        }
    }
    
    func updateCellText() {
        constraintYForImage.constant = lblCell.text?.count == 0 ? 0 : -10
    }
}
