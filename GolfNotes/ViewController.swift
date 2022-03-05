//
//  ViewController.swift
//  GolfNotes
//
//  Created by John Chang on 3/2/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ViewController: UITabBarController {
    
    let database = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")

        Auth.auth().addStateDidChangeListener() { auth, user in
            if let user = user {
                print("have a user")
            } else {
                self.presentLoginVC()
            }
        }
        
    }
    
    func presentLoginVC() {
        let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC_ID")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        _ = Auth.auth().addStateDidChangeListener { auth, user in
          // ...
        }
    }
    
    func sendTestData(){
        let docRef = database.document("users/user1234")
        docRef.setData(["name":"john", "lastName":"chang"])
    }
    
    


}

