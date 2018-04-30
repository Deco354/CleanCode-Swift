import Foundation

class Args {
    private let schema: String
    private let arguments: [String]
    private lazy var valid: Bool = parse()
    private var unexpectedArguments = NSMutableOrderedSet()
    private var booleanArguments = [Character: Bool]()
    private var numberOfArguments = 0
    
    init(withSchema schema: String, andArguments arguments: [String]) {
        self.schema = schema
        self.arguments = arguments
        valid = parse()
    }
    
    func isValid() -> Bool {
        return valid
    }
    
    private func parse() -> Bool {
        if schema.count == 0 && arguments.count == 0 {
            return true
        }
        parseSchema()
        parseArguments()
        return unexpectedArguments.count == 0
    }
    
    private func parseSchema() {
        for element in schema.split(separator: ",") {
            parseSchemaElement(element: String(element))
        }
    }
    
    private func parseSchemaElement(element: String) {
        if element.count == 1 {
            parseBooleanSchemaElement(element: element)
        }
    }
    
    private func parseBooleanSchemaElement(element: String) {
        guard let character = element.first else { return }
        let letters = CharacterSet.letters
        if letters.contains(character.unicodeScalars.first!) {
            booleanArguments[character] = false
        }
    }
    
    private func parseArguments() {
        for argument in arguments {
            parseArgument(argument: argument)
        }
    }
    
    private func parseArgument(argument: String) {
        if argument.first == "-" {
            parseElements(argument: argument)
        }
    }
    
    private func parseElements(argument: String) {
        for character in argument {
            parseElement(argumentCharacter: character)
        }
    }
    
    private func parseElement(argumentCharacter: Character) {
        if isBoolean(argumentCharacter: argumentCharacter) {
            numberOfArguments += 1
            setBooleanArg(argumentCharacter: argumentCharacter, value: true)
        } else {
            unexpectedArguments.add(argumentCharacter)
        }
    }
    
    private func setBooleanArg(argumentCharacter: Character, value: Bool) {
        booleanArguments[argumentCharacter] = value
    }
    
    private func isBoolean(argumentCharacter: Character) -> Bool {
        return booleanArguments.keys.contains(argumentCharacter)
    }
    
    func cardinality() -> Int {
        return numberOfArguments
    }
    
    func usage() -> String {
        return schema.isEmpty ? "" : "-[\(schema)]"
    }
    
    func errorMessage() -> String {
        return unexpectedArguments.count == 0 ? "" : unexpectedArgumentMessage()
    }
    
    private func unexpectedArgumentMessage() -> String {
        var argumentString = ""
        for argument in unexpectedArguments {
            let character = argument as! Character
            argumentString.append(character)
        }
        return "Argument(s) \(argumentString) unexpected."
    }
    
    func getBoolean(argument: Character) -> Bool? {
        return booleanArguments[argument]
    }
}

