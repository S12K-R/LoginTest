//
//  LoginViewController.swift
//  LoginTest
//
//  Created by Jorge Vasquez on 06/01/2023.
//

import Foundation
import UIKit


class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var EmailView: CustomTextField!
    @IBOutlet weak var PasswordView: CustomTextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var noAccountLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    let viewModel = loginViewModel()

    
    
    
    
    override func viewDidLoad() {
        
        
        EmailView.forgotPasswordButton.isHidden = true
        EmailView.placeholderLabel.text = "Email"
        PasswordView.placeholderLabel.text = "Password"
        viewModel.delegate = self
        
        
    }
    
    @IBAction func logInButtonTapped(_ sender: Any) {
        
        let email = EmailView.textField.text ?? ""
        let password = PasswordView.textField.text ?? ""
        let loginEntry = User(email: email, password: password)
        let method = URLCall.login
        viewModel.requestService(target: loginEntry, call: method)
        
    }
    
    
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        guard let registerVC = storyboard?.instantiateViewController(identifier: "RegisterViewController") as? RegisterViewController else {return}
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
}

extension LoginViewController {
    
    func showAlert(title: String, message: String) {
      let alertController = UIAlertController(title: title, message:
        message, preferredStyle: .alert)
      alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: {action in
      }))
      self.present(alertController, animated: true, completion: nil)
    }
    
}
extension LoginViewController: AlertSetter {
    func requestServiceSuccess(userData: Response) {
        guard let dashboardVC = self.storyboard?.instantiateViewController(identifier: "DashboardViewController") as? DashboardViewController else {return}
        self.navigationController?.pushViewController(dashboardVC, animated: true)
        dashboardVC.userData = userData
    }
    
    func requestServiceError(errorMessage: String) {
        self.showAlert(title: "Error", message: errorMessage)
    }
    

    
    

    
    
}
