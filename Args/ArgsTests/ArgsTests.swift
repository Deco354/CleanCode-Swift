import XCTest
@testable import Args

class ArgsTests: XCTestCase {
    
    
    func testCreateWithNoSchemaOrArguments() {
        let args = Args(withSchema: "", andArguments: [])
        XCTAssertEqual(0, args.cardinality())
    }
    
    // let exception = ExpectedException.none()
    
    
    func testWithNoSchemaButWithOneArgument() {
        let args = Args(withSchema: "", andArguments: ["-x"])
        XCTAssertEqual(false, args.isValid())
        XCTAssertEqual("Argument(s) -x unexpected.", args.errorMessage())
    }
    //
    //
        func testWithNoSchemaButWithMultipleArguments() {
        let args = Args(withSchema: "", andArguments: ["-x", "-y"])
        XCTAssertEqual(false, args.isValid())
        XCTAssertEqual("Argument(s) -xy unexpected.", args.errorMessage())
        }
    //
    //    // Currently fails...
    //
//        func testNonLetterSchema() {
//        exception.expect(ParseException.class)
//        exception.expectMessage("Bad character:*in Args format: *")
//
//        Args(withSchema: "*", andArguments: [])
//        }
    //
    //    // Currently fails...
    //
    //    func testInvalidArgumentFormat() {
    //    exception.expect(ParseException.class)
    //    exception.expectMessage("Argument: f has invalid format: ~.")
    //
    //    Args(withSchema: "f~", andArguments: [])
    //    }
    //
    //
    //    func testSimpleBooleanTruePresent() {
    //    let args = Args(withSchema: "x", ["-x", andArguments: "true"])
    //    XCTAssertEqual(1, args.cardinality())
    //    XCTAssertEqual(true, args.getBoolean('x'))
    //    }
    //
    //    // Currently fails...
    //
    //    func testSimpleBooleanFalsePresent() {
    //    let args = Args(withSchema: "x", ["-x", andArguments: "false"])
    //    XCTAssertEqual(1, args.cardinality())
    //    XCTAssertEqual(false, args.getBoolean('x'))
    //    }
    //
    //    // Currently fails...
    //
    //    func testMissingBooleanArgument() {
    //    let args = Args(withSchema: "x", andArguments: ["-x"])
    //    XCTAssertEqual(false, args.isValid())
    //    }
    //
    //    // Currently fails...
    //
    //    func testInvalidBoolean() {
    //    let args = Args(withSchema: "x", ["-x", andArguments: "Truthy"])
    //    XCTAssertEqual(1, args.cardinality())
    //    XCTAssertEqual(false, args.getBoolean('x'))
    //    }
    //
    //
    //    func testMultipleBooleans() {
    //    let args = Args(withSchema: "x,y", ["-xy", "true", andArguments: "true"])
    //    XCTAssertEqual(2, args.cardinality())
    //    XCTAssertEqual(true, args.getBoolean('x'))
    //    XCTAssertEqual(true, args.getBoolean('y'))
    //    }
    //
    //    // Currently fails...
    //
    //    func testSpacesInFormat() {
    //    let args = Args(withSchema: "x, y", ["-xy", "true", andArguments: "true"])
    //    XCTAssertEqual(2, args.cardinality())
    //    XCTAssertEqual(true, args.getBoolean('x'))
    //    XCTAssertEqual(true, args.getBoolean('y'))
    //    }
    //
    //    // Currently fails...
    //
    //    func testInvalidArgumentValueFormat() {
    //    let args = Args(withSchema: "x,y", ["xy", "true", andArguments: "false"])
    //    XCTAssertEqual(false, args.isValid())
    //    }
    
}
