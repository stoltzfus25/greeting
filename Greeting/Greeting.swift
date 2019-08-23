//
//  Greeting.swift
//  Greeting
//
//  Created by Samuel Stoltzfus on 8/2/19.
//  Copyright © 2019 Superior Plastic Products, Inc. All rights reserved.
//

import Foundation

class Greeting {
    
    func greet(_ name: String? = nil) -> String {
        guard let name = name else { return greet([]) }
        return greet([name])
    }
    
    func greet(_ names: [String]) -> String {
        let defaultGreeting = "my friend"
        
        guard !names.isEmpty else {
            return sayHello(names: [defaultGreeting])
        }
        
        if names[0].uppercased() == names[0] {
            return shoutHello(name: names[0])
        }
        
        return sayHello(names: names)
    }
    
    private func sayHello(names: [String]) -> String {
        guard names.count > 1 else {
            return sayHelloSeparator(names: names, separator: "")
        }
        
        var newNames = names
        newNames[newNames.count - 1] = "and \(newNames.last!)"
        
        let separator = names.count > 2 ? ", " : " "
        return sayHelloSeparator(names: newNames, separator: separator)
    }
    
    private func sayHelloSeparator(names: [String], separator: String) -> String {
        return "Hello, \(names.joined(separator: separator))."
    }
    
    private func shoutHello(name: String) -> String {
        return "HELLO, \(name.uppercased())!"
    }
}
