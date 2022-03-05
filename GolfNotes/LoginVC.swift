//
//  LoginVC.swift
//  GolfNotes
//
//  Created by John Chang on 3/3/22.
//

import Foundation
import UIKit
import FirebaseAuth


class LoginVC: UIViewController, UITextViewDelegate {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    var email: String?
    var password: String?
    
    override func viewDidLoad() {
        
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        if let email = emailTF.text, let password = passwordTF.text {
            print("email: \(email) and pw: \(password)")
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                print("got email and tf")
//                print(error?.localizedDescription)
                if error == nil {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        if let email = emailTF.text, let password = passwordTF.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.dismiss(animated: true, completion: nil)
            }
        }
    }
}
