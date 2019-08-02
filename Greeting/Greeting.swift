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
            return sayHello(names: [standInName])
        }
        
        if names[0].uppercased() == names[0] {
            return shoutHello(name: names[0])
        }
        
        return sayHello(names: names)
    }
    
    private func sayHello(names: [String]) -> String {
        return "Hello, \(names.joined(separator: " and "))."
    }
    
    private func shoutHello(name: String) -> String {
        return "HELLO, \(name.uppercased())!"
    }
}
