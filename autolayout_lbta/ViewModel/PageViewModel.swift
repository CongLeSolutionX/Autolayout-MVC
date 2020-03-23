//
//  PageViewModel.swift
//  autolayout_lbta
//
//  Created by Cong Le on 3/23/20.
//  Copyright © 2020 Lets Build That App. All rights reserved.
//

import Foundation

struct PageViewModel {
    let imageName: String
    let headerText: String
    let bodyText: String
    
    // initializer with DI
    init(page: Page) {
        self.imageName = page.imageName
        self.headerText = page.headerText
        self.bodyText = page.bodyText
    }
}
