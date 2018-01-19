//
//  ViewController.swift
//  CustomCollecionViewFlowLayout
//
//  Created by amitan on 2015/06/20.
//  Copyright (c) 2015年 amitan. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController{

    private let cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let  layout = self.collectionView?.collectionViewLayout as? CustomCollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            layout.minimumLineSpacing = 8
            layout.minimumInteritemSpacing = 8
            
            layout.maxColumn = 3
            layout.cellPattern.append((sideLength: 2,heightLength: 2,column: 0,row: 0))
            layout.cellPattern.append((sideLength: 1,heightLength: 1,column: 2,row: 0))
            layout.cellPattern.append((sideLength: 1,heightLength: 2,column: 2,row: 1))
            layout.cellPattern.append((sideLength: 1,heightLength: 2,column: 0,row: 2))
            layout.cellPattern.append((sideLength: 1,heightLength: 1,column: 1,row: 2))
            layout.cellPattern.append((sideLength: 2,heightLength: 1,column: 1,row: 3))
        }
        
        collectionView?.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: cellIdentifier)
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) 
        let mainLabel = UILabel(frame: cell.frame)
        
        mainLabel.text = "\(indexPath.section)-\(indexPath.item)"
        mainLabel.textAlignment = .center
        mainLabel.backgroundColor = UIColor.blue
        cell.backgroundView = mainLabel
        cell.clipsToBounds = true
        cell.addSubview(mainLabel)
        return cell
    }
}
