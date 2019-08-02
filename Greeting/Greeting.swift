//
//  Greeting.swift
//  Greeting
//
//  Created by Samuel Stoltzfus on 8/2/19.
//  Copyright © 2019 Superior Plastic Products, Inc. All rights reserved.
//

import Foundation

class Greeting {
    func greet(_ names: [String]? = nil) -> String {
        let standInName = "my friend"
        
        guard let names = names, !names.isEmpty else {
            return "Hello, \(standInName)."
        }
        
        if names.count == 2 {
            return "Hello, \(names[0]) and \(names[1])."
        } else {
            if names[0].uppercased() == names[0] {
                return "HELLO, \(names[0].uppercased())!"
            } else {
                return "Hello, \(names[0])."
            }
        }
    }
}
