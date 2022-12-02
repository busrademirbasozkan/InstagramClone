//
//  ViewController.swift
//  InstagramClone
//
//  Created by Büşra Özkan on 2.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signinButton(_ sender: Any) {
        performSegue(withIdentifier: "toTabBar", sender: nil)
    }
    
    
    @IBAction func signupButton(_ sender: Any) {
    }
    
}

