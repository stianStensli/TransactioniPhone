//
//  loginController.swift
//  Transaction
//
//  Created by Stian  Stensli on 15/4/18.
//  Copyright © 2018 Stian  Stensli. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: UIButton) {
        if let emailString = email.text{
            print("Email: \(emailString)")
        }
        if let pswString = password.text{
            print("Password: \(pswString)")
        }
    }
    
    
}
