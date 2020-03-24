//
//  SwippingControlller+Extension.swift
//  autolayout_lbta
//
//  Created by Cong Le on 3/23/20.
//  Copyright © 2020 Lets Build That App. All rights reserved.
//

import UIKit
// swiftlint:disable all 
extension SwippingController {

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            // supproting landscape and portrait view mode
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage  == 0 {
                self.collectionView.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }) { (_) in
        }
    }
    
}
