//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var errorLabel: UILabel!

    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print(error.localizedDescription)
                    self.errorLabel.text = error.localizedDescription
                    self.errorLabel.isHidden = false

                } else {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                    self.emailTextfield.text = ""
                    self.passwordTextfield.text = ""
                }
            }
        }
    }

    @IBAction func emailFieldChanged(_ sender: Any) {
        if !errorLabel.isHidden {
            errorLabel.isHidden = true
        }
    }

    @IBAction func passwordFieldChanged(_ sender: Any) {
        if !errorLabel.isHidden {
            errorLabel.isHidden = true
        }
    }
}
