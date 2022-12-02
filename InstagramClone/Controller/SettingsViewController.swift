//
//  SettingsViewController.swift
//  InstagramClone
//
//  Created by Büşra Özkan on 2.12.2022.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutButton(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toMainVC", sender: nil)
        }catch{
            
        }
    }
    
}
