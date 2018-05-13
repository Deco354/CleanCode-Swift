import XCTest
@testable import Args

class ArgsTests: XCTestCase {
    
    
    func testCreateWithNoSchemaOrArguments() {
        let args = try! Args(withSchema: "", andArguments: [])
        XCTAssertEqual(0, args.cardinality())
    }
    
    // let exception = ExpectedException.none()
    
    
    func testWithNoSchemaButWithOneArgument() {
        XCTAssertThrowsError(try Args(withSchema: "", andArguments: ["-x"])) { error in
            XCTAssertEqual(error as? ParseError, ParseError.unexpectedArgument(message: "Argument(s) -x unexpected."))
        }
    }
    //
    //
        func testWithNoSchemaButWithMultipleArguments() {
            XCTAssertThrowsError(try Args(withSchema: "", andArguments: ["-x", "-y"])) { error in
                XCTAssertEqual(error as? ParseError, ParseError.unexpectedArgument(message: "Argument(s) -xy unexpected."))
            }
            
//        let args = try! Args(withSchema: "", andArguments: ["-x", "-y"])
//        XCTAssertEqual(false, args.isValid())
//        XCTAssertEqual("Argument(s) -xy unexpected.", args.errorMessage())
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
        func testSimpleBooleanTruePresent() {
        
            do {
                let args = try Args(withSchema: "x", andArguments: ["-x",  "true"])
                XCTAssertEqual(1, args.cardinality())
                XCTAssertEqual(true, args.getBoolean(argument: "x"))
            } catch {
                let parseError = error as? ParseError
                XCTFail(parseError?.errorDescription ?? "Unknown Error")
            }
        }
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
//        func testMultipleBooleans() {
//        let args = try! Args(withSchema: "x,y", andArguments: ["-xy", "true", "true"])
//        XCTAssertEqual(2, args.cardinality())
//            XCTAssertEqual(true, args.getBoolean(argument: "x"))
//            XCTAssertEqual(true, args.getBoolean(argument: "y"))
//        }
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
