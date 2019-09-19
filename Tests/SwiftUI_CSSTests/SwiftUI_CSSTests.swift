import XCTest
@testable import SwiftUI_CSS

final class SwiftUI_CSSTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let a = CSSStyle([.font(.caption)])
        let b = CSSStyle([.backgroundColor(.red)])
        
        let c = a + b
        print("a+b = \(c)")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
