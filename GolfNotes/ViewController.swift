//
//  ViewController.swift
//  GolfNotes
//
//  Created by John Chang on 3/2/22.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    
    let database = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sendTestData()
    }
    
    func sendTestData(){
        let docRef = database.document("users/user1234")
        docRef.setData(["name":"john", "lastName":"chang"])
    }


}

