//
//  RestApiManager.swift
//  Transaction
//
//  Created by Stian  Stensli on 15/4/18.
//  Copyright © 2018 Stian  Stensli. All rights reserved.
//

import Foundation

class RestApiManager {
    
    private static let scheme = "http"
    private static let apiURL = "192.168.0.27"
    private static let apiURLBtcValue = "/api/bitCoinValue"
    private static let apiURLBuys = "/api/transaction/buys"
    private static let apiURLSells = "/api/transaction/sells"
    
    private static let port = 8080
    
    private static var btcValue:Double = -1
    private static var sells:[TransactionDto] = []
    private static var buys:[TransactionDto]  = []
    
    static func getBtcValue() -> Double{
        
        let urlComponents = setUpUrl(path: apiURLBtcValue)
    
        if let url = urlComponents.url {
            print(url)
        
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error ==  nil, let string = String(data:data, encoding: .utf8) else { return }
                print("String\(string)")
                if let value = Double(string){
                    self.btcValue = value
                }
                }.resume()
        }
        return btcValue;
        
    }
    
    static func getSells() -> [TransactionDto]{
        
        let urlComponents = setUpUrl(path: apiURLSells)
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            do{
                self.sells = try JSONSerialization.jsonObject(with: data) as! [TransactionDto]
            } catch {
                print (error)
            }
        
        }
        task.resume()
        
        return sells;
        
    }
    static func getBuys() -> [TransactionDto]{
        
        let urlComponents = setUpUrl(path: apiURLBuys)
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            do{
                self.buys = try JSONSerialization.jsonObject(with: data) as! [TransactionDto]
            } catch {
                print (error)
            }
            
        }
        task.resume()
        
        return buys;
        
    }
    
    
    private static func setUpUrl(path:String) -> URLComponents{
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = apiURL
        urlComponents.port = port
        urlComponents.path = path
        
        return urlComponents;
        
    }
}
