//
//  CustomTextField.swift
//  LoginTest
//
//  Created by Jorge Vasquez on 18/01/2023.
//

import Foundation
import UIKit

class CustomTextField: UIView {
    
    
    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet var contentView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("CustomTextField", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
      
        
    }
    
  
    
}

