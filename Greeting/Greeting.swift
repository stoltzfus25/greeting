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
        if let n = name?.uppercased(), n == name {
            return "HELLO, \(n)!"
        } else {
            return "Hello, \(name ?? "my friend")."
        }
    }
}
