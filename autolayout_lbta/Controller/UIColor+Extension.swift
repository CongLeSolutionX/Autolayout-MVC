//
//  UIColor+Extension.swift
//  autolayout_lbta
//
//  Created by Cong Le on 3/23/20.
//  Copyright © 2020 Lets Build That App. All rights reserved.
//

import UIKit

// MARK: Customized UIColors
extension UIColor {
    static var mainPink = UIColor.rgb(red: 232, green: 68, blue: 133)
    static var lighterPink = UIColor.rgb(red: 249, green: 207, blue: 224)
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
