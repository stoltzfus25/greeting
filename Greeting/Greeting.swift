//
//  Greeting.swift
//  Greeting
//
//  Created by Samuel Stoltzfus on 8/2/19.
//  Copyright © 2019 Superior Plastic Products, Inc. All rights reserved.
//

import Foundation

class Greeting {
    
    private let defaultName = "my friend"
    
    func greet(_ names: [String]? = nil) -> String {
        let names = sanitizeNames(names)
        
        guard !names.isEmpty, let firstName = names.first else {
            return sayHello(name: defaultName)
        }
        
        guard names.count > 1 else {
            return firstName.isUpperCased ? shoutHello(name: firstName) : sayHello(name: firstName)
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
    
    private func sanitizeNames(_ names: [String]?) -> [String] {
        var newNames = [String]()

        for name in names ?? [] {
            if name.starts(with: "\"") {
                newNames.append(name.trim(character: "\""))
            } else {
                newNames.append(contentsOf: name.split(separator: ",").map { "\($0)".trim() } )
            }
        }

        return newNames
    }
}

extension String {
    var isUpperCased: Bool {
        return self.uppercased() == self
    }
    
    func trim(character: String? = nil) -> String {
        guard let char = character else {
            return self.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
        return self.trimmingCharacters(in: CharacterSet(charactersIn: char))
    }
}
