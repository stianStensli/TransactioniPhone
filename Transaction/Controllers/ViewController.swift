//
//  ViewController.swift
//  Transaction
//
//  Created by Stian  Stensli on 14/4/18.
//  Copyright © 2018 Stian  Stensli. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btcValueTxt: UILabel!
    @IBOutlet weak var sellTable: UITableView!
    @IBOutlet weak var buyTable: UITableView!
    
    private var sells:[TransactionDto] = []
    private var buys:[TransactionDto]  = []
    
    var btcValue:Double?
    
    //Update UI after load...
    override func viewDidLoad() {
        super.viewDidLoad()
        getJsonFromUrl()
        changeLabels()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func refresh() {
        getJsonFromUrl()
        changeLabels()
        
    }
    func getJsonFromUrl(){
        btcValue = RestApiManager.getBtcValue();
       
        sells = RestApiManager.getSells()
        buys = RestApiManager.getBuys()
    }

    func changeLabels() {
        if let temp = btcValue{
            print("first!")
            btcValueTxt.text = "Bitcoin Value: \(temp)"
        }
    }
    
    func fillTables() {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logout(_ sender: UIButton) {
        
    }
    
    
    
}

