//
//  ViewController.swift
//  KEStoryLikeCollection
//
//  Created by Kaan Esin on 24.03.2020.
//  Copyright © 2020 Kaan Esin. All rights reserved.
//

import UIKit

class KEStoryLikeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: KEStoryLikeCollectionView!
    var itemArray: [(color: UIColor, title: String)]?
    var insetValue: CGFloat = 5.0
    var cellWidth: CGFloat = 80.0
    var cellHeight: CGFloat = 108.0
    var minimumLineSpacing: CGFloat = 5.0
    var minimumInteritemSpacing: CGFloat = 5.0
    var isImageCircleOnCell: Bool = true
    var backgroundColor: UIColor = .lightGray
    var scrollDirection: UICollectionView.ScrollDirection = .horizontal

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.prepareFlowLayout(cellWidth: cellWidth, cellHeight: cellHeight, scrollDirection: scrollDirection, minimumLineSpacing: minimumLineSpacing, minimumInteritemSpacing: minimumInteritemSpacing, insetValue: insetValue, backgroundColor: backgroundColor)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KEStoryLikeCell", for: indexPath) as! KEStoryLikeCell
        cell.backgroundColor = .gray
        if let item = itemArray?[indexPath.row] {
            cell.lblCell.text = item.title
            cell.updateCellText()
            cell.imgCell.backgroundColor = item.color
            cell.updateCellImage(isImageCircle: isImageCircleOnCell)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}
