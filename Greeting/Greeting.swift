//
//  Greeting.swift
//  Greeting
//
//  Created by Samuel Stoltzfus on 8/2/19.
//  Copyright © 2019 Superior Plastic Products, Inc. All rights reserved.
//

import Foundation

class Greeting {
    func greet(_ name: [String]? = nil) -> String {
        let standInName = "my friend"
        
        if let n = name, n.count == 2 {
            return "Hello, Jill and Jane."
        } else {
            if let n = name, !n.isEmpty {
                if n[0].uppercased() == n[0] {
                    return "HELLO, \(n[0].uppercased())!"
                } else {
                    return "Hello, \(n[0])."
                }
            } else {
                return "Hello, \(standInName)."
            }
        }
    }
}
