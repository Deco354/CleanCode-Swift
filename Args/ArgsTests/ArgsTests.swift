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
    //    func testWithNoSchemaButWithMultipleArguments() throws Exception {
    //    let args = Args("", ["-x", "-y"])
    //    assertEquals(false, args.isValid())
    //    assertEquals("Argument(s) -xy unexpected.", args.errorMessage())
    //    }
    //
    //    // Currently fails...
    //
    //    func testNonLetterSchema() throws Exception {
    //    exception.expect(ParseException.class)
    //    exception.expectMessage("Bad character:*in Args format: *")
    //
    //    Args("*", [])
    //    }
    //
    //    // Currently fails...
    //
    //    func testInvalidArgumentFormat() throws Exception {
    //    exception.expect(ParseException.class)
    //    exception.expectMessage("Argument: f has invalid format: ~.")
    //
    //    Args("f~", [])
    //    }
    //
    //
    //    func testSimpleBooleanTruePresent() throws Exception {
    //    let args = Args("x", ["-x", "true"])
    //    assertEquals(1, args.cardinality())
    //    assertEquals(true, args.getBoolean('x'))
    //    }
    //
    //    // Currently fails...
    //
    //    func testSimpleBooleanFalsePresent() throws Exception {
    //    let args = Args("x", ["-x", "false"])
    //    assertEquals(1, args.cardinality())
    //    assertEquals(false, args.getBoolean('x'))
    //    }
    //
    //    // Currently fails...
    //
    //    func testMissingBooleanArgument() throws Exception {
    //    let args = Args("x", ["-x"])
    //    assertEquals(false, args.isValid())
    //    }
    //
    //    // Currently fails...
    //
    //    func testInvalidBoolean() throws Exception {
    //    let args = Args("x", ["-x", "Truthy"])
    //    assertEquals(1, args.cardinality())
    //    assertEquals(false, args.getBoolean('x'))
    //    }
    //
    //
    //    func testMultipleBooleans() throws Exception {
    //    let args = Args("x,y", ["-xy", "true", "true"])
    //    assertEquals(2, args.cardinality())
    //    assertEquals(true, args.getBoolean('x'))
    //    assertEquals(true, args.getBoolean('y'))
    //    }
    //
    //    // Currently fails...
    //
    //    func testSpacesInFormat() throws Exception {
    //    let args = Args("x, y", ["-xy", "true", "true"])
    //    assertEquals(2, args.cardinality())
    //    assertEquals(true, args.getBoolean('x'))
    //    assertEquals(true, args.getBoolean('y'))
    //    }
    //
    //    // Currently fails...
    //
    //    func testInvalidArgumentValueFormat() throws Exception {
    //    let args = Args("x,y", ["xy", "true", "false"])
    //    assertEquals(false, args.isValid())
    //    }
    
}
