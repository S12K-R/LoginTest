//
//  DashboardViewController.swift
//  LoginTest
//
//  Created by Sebastian Villahermosa on 27/04/2023.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    public var userData: Response!
    override func viewDidLoad() {
        super.viewDidLoad()

        userLabel.text = userData.email
    }
    

   
}
