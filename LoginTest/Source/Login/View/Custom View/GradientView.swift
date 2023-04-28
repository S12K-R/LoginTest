//
//  GradientView.swift
//  LoginTest
//
//  Created by Sebastian Villahermosa on 27/04/2023.
//

import UIKit

class GradientView: UIView {
    override open class var layerClass: AnyClass {
       return CAGradientLayer.classForCoder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = layer as! CAGradientLayer
        if #available(iOS 15.0, *) {
            gradientLayer.colors = [UIColor.systemCyan.cgColor, UIColor.white.cgColor]
        } else {
            gradientLayer.colors = [UIColor.black.cgColor, UIColor.cyan.cgColor]
        }
        
        gradientLayer.locations = [0,0.5]
    }
}
    


