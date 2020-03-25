//
//  KEStoryLikeCell.swift
//  KEStoryLikeCollection
//
//  Created by Kaan Esin on 25.03.2020.
//  Copyright © 2020 Kaan Esin. All rights reserved.
//

import UIKit

protocol KEStoryLikeCellDelegate: NSObject {
    func btnSelected(sender: UIButton)
}

class KEStoryLikeCell: UICollectionViewCell {
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lblCell: UILabel!
    @IBOutlet weak var constraintYForImage: NSLayoutConstraint!
    @IBOutlet weak var btnOnCell: UIButton!
    var delegate: KEStoryLikeCellDelegate?
    
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
    
    @IBAction func btnClicked(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowAnimatedContent, .allowUserInteraction], animations: {
            self.imgCell.transform = CGAffineTransform.init(scaleX: 0.85, y: 0.85)
        }, completion: { (finished) in
            if finished {
                UIView.animate(withDuration: 0.1, delay: 0.1, options: [.allowAnimatedContent, .allowUserInteraction], animations: {
                    self.imgCell.transform = CGAffineTransform.identity
                }, completion: { (finished) in
                    if finished {
                        self.delegate?.btnSelected(sender: sender)
                    }
                })
            }
        })
    }
    
    @IBAction func btnTouchDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowAnimatedContent, .allowUserInteraction], animations: {
            self.imgCell.transform = CGAffineTransform.init(scaleX: 0.85, y: 0.85)
        }, completion: nil)
    }
    
    @IBAction func btnCancel(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowAnimatedContent, .allowUserInteraction], animations: {
            self.imgCell.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
