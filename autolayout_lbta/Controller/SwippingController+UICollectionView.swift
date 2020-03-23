//
//  SwippingController+UICollectionView.swift
//  autolayout_lbta
//
//  Created by Cong Le on 3/23/20.
//  Copyright © 2020 Lets Build That App. All rights reserved.
//

import UIKit

extension SwippingController {
    //MARK: CollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        // select current image/description with corresponding index cell
//
//        let page = pages[indexPath.item]
//        cell.page = page
        
        
        // cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green // iterate 2 items with 2 different color
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    //MARK: CollectionViewDelegateFlowLayoutDelegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

