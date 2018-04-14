//
//  ViewController.swift
//  Transaction
//
//  Created by Stian  Stensli on 14/4/18.
//  Copyright © 2018 Stian  Stensli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        print("hello world!")
    }
    @IBAction func logout(_ sender: UIButton) {
        
    }
    
    
}

