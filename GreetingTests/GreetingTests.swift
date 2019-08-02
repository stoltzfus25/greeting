//
//  GreetingTests.swift
//  GreetingTests
//
//  Created by Samuel Stoltzfus on 8/2/19.
//  Copyright © 2019 Superior Plastic Products, Inc. All rights reserved.
//

import XCTest
@testable import Greeting

class GreetingTests: XCTestCase {

    let sut = Greeting()

    func testName_GreetsName() {
        XCTAssertEqual(sut.greet("Bob"), "Hello, Bob.")
        XCTAssertEqual(sut.greet("Nancy"), "Hello, Nancy.")
    }
    
    func testNull_GreetsStandIn() {
        XCTAssertEqual(sut.greet(), "Hello, my friend.")
    }
    
    func testAllUppercase_GreetsWithShouting() {
        XCTAssertEqual(sut.greet("JERRY"), "HELLO, JERRY!")
        XCTAssertEqual(sut.greet("BILL"), "HELLO, BILL!")
    }
    
    func testSomeUppercase_DoesNotGreetWithShouting() {
        XCTAssertEqual(sut.greet("JeRRY"), "Hello, JeRRY.")
    }
}
