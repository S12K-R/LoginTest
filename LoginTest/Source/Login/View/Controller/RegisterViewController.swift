//
//  RegisterViewController.swift
//  LoginTest
//
//  Created by Jorge Vasquez on 26/01/2023.
//

import UIKit


class RegisterViewController: UIViewController {
    
    @IBOutlet weak var registerEmailView: CustomTextField!
    @IBOutlet weak var registerPasswordView: CustomTextField!
    @IBOutlet weak var registerButton: UIButton!
    let viewModel = loginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerEmailView.placeholderLabel.text = "Email"
        registerPasswordView.placeholderLabel.text = "Password"
        registerEmailView.forgotPasswordButton.isHidden = true
        registerPasswordView.forgotPasswordButton.isHidden = true
        viewModel.delegate = self
        
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        let email = registerEmailView.textField.text ?? ""
        let password = registerPasswordView.textField.text ?? ""
        let registerEntry = NewUser(email: email, password: password)
        let method = URLCall.register
        viewModel.requestService(target: registerEntry, call: method)
        
        
    }
    
    func backToMain() {
        guard let loginVC = storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController else {return}
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    
}

extension RegisterViewController {
   
      func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:
          message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: {action in
            self.backToMain()
        }))
        self.present(alertController, animated: true, completion: nil)
      }
    
}

extension RegisterViewController: AlertSetter {
    
    func requestServiceSuccess(userData: Response) {
        guard let dashboardVC = storyboard?.instantiateViewController(identifier: "DashboardViewController") as? DashboardViewController else {return}
        navigationController?.pushViewController(dashboardVC, animated: true)
    }
    
    func requestServiceError(errorMessage: String) {
        self.showAlert(title: "Error", message: errorMessage)
    }
    
   
    
    
}
