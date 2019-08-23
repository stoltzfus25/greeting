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
        let name = name ?? "my friend"
        return name.isUpperCased ? shoutHello(name: name) : sayHello(name: name)
    }
    
    func greet(_ names: [String]) -> String {
        guard names.count > 1 else {
            return greet(names.first)
        }
        
        let lowercasedNames = names.filter { !$0.isUpperCased }
        let uppercasedNames = names.filter { $0.isUpperCased }
        
        let joinedNames = joinMultipleNames(names: lowercasedNames)
        if uppercasedNames.isEmpty {
            return sayHello(name: joinedNames)
        } else {
            return "\(sayHello(name: joinedNames)) AND HELLO \(uppercasedNames[0])!"
        }
    }
    
    private func joinMultipleNames(names: [String]) -> String {
        switch names.count {
        case 0...2:
            return names.joined(separator: " and ")
        default:
            var newNames = names
            newNames[newNames.count - 1] = "and \(newNames.last!)"
            return newNames.joined(separator: ", ")
        }
    }
    
    private func sayHello(name: String) -> String {
        return "Hello, \(name)."
    }
    
    private func shoutHello(name: String) -> String {
        return "HELLO, \(name.uppercased())!"
    }
}

extension String {
    var isUpperCased: Bool {
        return self.uppercased() == self
    }
}
