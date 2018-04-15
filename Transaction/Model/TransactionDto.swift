//
//  TransactionDto.swift
//  Transaction
//
//  Created by Stian  Stensli on 15/4/18.
//  Copyright © 2018 Stian  Stensli. All rights reserved.
//

import Foundation

class TransactionDto {
    private var offerPrice:Double = 0.0
    private var amount:Double = 0.0
    
    
    func getOfferPrice() -> Double {
        return offerPrice
    }
    
    func setOfferPrice(offerPrice:Double) {
        self.offerPrice = offerPrice
    }
    
    func getAmount() -> Double {
        return amount
    }
    
    func setAmount(amount:Double) {
        self.amount = amount
    }
}
