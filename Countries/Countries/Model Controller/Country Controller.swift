//
//  Country Controller.swift
//  Countries
//
//  Created by Alex Rhodes on 11/14/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

@ objc class CountryController: NSObject {
    
    let baseURL = URL(string: "https://restcountries.eu/rest/v2/")!
    
    @objc var countries: [ARCountry] = []
    
    typealias CompletionHandler = (Error?) -> Void
    
    @objc func fetchCountries(completion: @escaping CompletionHandler) {
        
        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            
            if let error = error {
                completion(error)
                return
            }
            
            guard let data = data else {
                completion(error)
                return
            }
            
            do {
                
                let jsonArray = try JSONSerialization.jsonObject(with: data, options: [])
                for jsonDictionary in jsonArray as! [[String : Any]] {
                    guard let country = ARCountry.init(dictionary: jsonDictionary) else {return}
                    self.countries.append(country)
                    
                }
                
            } catch {
               NSLog("Error: \(error)")
                completion(nil)
            }
            completion(nil)
            
        }.resume()
    }
}
