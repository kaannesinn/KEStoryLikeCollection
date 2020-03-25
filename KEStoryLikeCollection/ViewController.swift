//
//  ViewController.swift
//  KEStoryLikeCollection
//
//  Created by Kaan Esin on 24.03.2020.
//  Copyright © 2020 Kaan Esin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var itemArray = [["color": UIColor.red, "title": "1 sdfasdf"],
                     ["color": UIColor.darkGray, "title": "2 fsdvv dsajsd"],
                     ["color": UIColor.green, "title": "3 wrlekf asdjh"],
                     ["color": UIColor.cyan, "title": "4 skjcvlsdföjh"],
                     ["color": UIColor.magenta, "title": "5 123ıoyohsc kasjd"],
                     ["color": UIColor.red, "title": "6 sdmvj"],
                     ["color": UIColor.yellow, "title": "7 SDFKJH JSGHFKJGASDFD"],
                     ["color": UIColor.black, "title": "8 12837"],
                     ["color": UIColor.blue, "title": "9 zxcvOSDF SKLDF"],
                     ["color": UIColor.green, "title": "10 msnvöcx"]]
    var insetValue: CGFloat = 5.0
    var cellWidth: CGFloat = 80.0
    var cellHeight: CGFloat = 108.0
    var minimumLineSpacing: CGFloat = 5.0
    var minimumInteritemSpacing: CGFloat = 5.0
    var isImageCircleOnCell: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = minimumLineSpacing
        flowLayout.minimumInteritemSpacing = minimumInteritemSpacing
        flowLayout.sectionInset = UIEdgeInsets(top: insetValue, left: insetValue, bottom: insetValue, right: insetValue)
        collectionView.collectionViewLayout = flowLayout
        collectionView.backgroundColor = .lightGray
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
        cell.backgroundColor = .gray
        let item = itemArray[indexPath.row]
        cell.lblCell.text = item["title"] as! String
        cell.updateCellText()
        cell.imgCell.backgroundColor = item["color"] as! UIColor
        cell.updateCellImage(isImageCircle: isImageCircleOnCell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}

