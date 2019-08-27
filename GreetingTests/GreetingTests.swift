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
        XCTAssertEqual(sut.greet(["Bob"]), "Hello, Bob.")
        XCTAssertEqual(sut.greet(["Nancy"]), "Hello, Nancy.")
    }
    
    func testNull_GreetsStandIn() {
        XCTAssertEqual(sut.greet(), "Hello, my friend.")
        XCTAssertEqual(sut.greet([]), "Hello, my friend.")
    }
    
    func testAllUppercase_GreetsWithShouting() {
        XCTAssertEqual(sut.greet(["JERRY"]), "HELLO, JERRY!")
        XCTAssertEqual(sut.greet(["BILL"]), "HELLO, BILL!")
    }
    
    func testSomeUppercase_DoesNotGreetWithShouting() {
        XCTAssertEqual(sut.greet(["JeRRY"]), "Hello, JeRRY.")
    }
    
    func testTwoNames_GreetsAllNames() {
        XCTAssertEqual(sut.greet(["Jill", "Jane"]), "Hello, Jill and Jane.")
        XCTAssertEqual(sut.greet(["Jack", "Jill"]), "Hello, Jack and Jill.")
    }
    
    func testThreeOrMoreNames_GreetsAllNamesWithOxfordComma() {
        XCTAssertEqual(sut.greet(["Amy", "Brian", "Charlotte"]), "Hello, Amy, Brian, and Charlotte.")
        XCTAssertEqual(sut.greet(["Amy", "Brian", "Charlotte", "Donald"]), "Hello, Amy, Brian, Charlotte, and Donald.")
    }
    
    func testOneUpperCaseName_GreetsUppercaseNameSeparately() {
        XCTAssertEqual(sut.greet(["Amy", "BRIAN", "Charlotte"]), "Hello, Amy and Charlotte. AND HELLO BRIAN!")
        XCTAssertEqual(sut.greet(["SAMUEL", "Aaron", "Gideon"]), "Hello, Aaron and Gideon. AND HELLO SAMUEL!")
    }
    
    func testNameHasComma_SplitsOnComma() {
        XCTAssertEqual(sut.greet(["Bob", "Charlie, Dianne"]), "Hello, Bob, Charlie, and Dianne.")
        XCTAssertEqual(sut.greet(["Jeff, Kayla", "Lydia"]), "Hello, Jeff, Kayla, and Lydia.")
    }
    
    func testNameHasEscapedComma_DoesNotSplit() {
        XCTAssertEqual(sut.greet(["Bob", "\"Charlie, Dianne\""]), "Hello, Bob and Charlie, Dianne.")
        XCTAssertEqual(sut.greet(["\"Edgar, Fern\""]), "Hello, Edgar, Fern.")
    }
}
