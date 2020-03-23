//
//  ViewController.swift
//  autolayout_lbta
//
//  Created by Brian Voong on 9/25/17.
//  Copyright © 2017 Lets Build That App. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: App lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Customized UIColors
extension UIColor{
    static var mainPink = UIColor.rgb(r: 232, g: 68, b: 133)
    static var lighterPink = UIColor.rgb(r: 249, g: 207, b: 224)
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}







