import Foundation

class Args {
    private let schema: String
    private let arguments: [String]
    private var valid: Bool = true
    private var unexpectedArguments = NSMutableOrderedSet()
    private var booleanArguments = [Character: Bool]()
    private var stringArguments = [Character: String]()
    
    private var argumentsFound = Set<Character>()
    private var currentArgument = 0
    private var errorArgument: Character = "\0"
    
    init(withSchema schema: String, andArguments arguments: [String]) throws {
        self.schema = schema
        self.arguments = arguments
        valid = try parse()
        guard unexpectedArguments.count == 0 else { throw ParseError.unexpectedArgument(message: unexpectedArgumentMessage()) }
    }
    
    func isValid() -> Bool {
        return valid
    }
    
    private func parse() throws -> Bool {
        if schema.isEmpty && arguments.isEmpty {
            return true
        }
        try parseSchema()
        try parseArguments()
        return valid
    }
    
    private func parseSchema() throws  {
        for element in schema.split(separator: ",") where !element.isEmpty {
            let trimmedElement = element.trimmingCharacters(in: .whitespaces)
            try parseSchemaElement(element: String(trimmedElement))
        }
    }
    
    private func parseSchemaElement(element: String) throws {
        let elementId = element.first!
        let tailIndex = element.index(element.startIndex, offsetBy: 1)
        let elementTail = String(element.suffix(from: tailIndex))
        try validateSchemaElementId(withCharacter: elementId)
        if isBooleanSchemaElement(elementTail: elementTail) {
            parseBooleanSchemaElement(elementID: elementId);
        } else if isStringSchemaElement(elementTail: elementTail) {
            parseStringSchemaElement(elementID: elementId);
        }
    }
    
    private func validateSchemaElementId(withCharacter elementId: Character) throws {
        guard elementId.isLetter() else {
            throw ParseError.badCharacter(message: "Bad character: \(elementId) in Args format: \(schema)")
        }
    }
    
    private func isBooleanSchemaElement(elementTail: String) -> Bool {
        return elementTail.isEmpty
    }
    
    private func isStringSchemaElement(elementTail: String) -> Bool {
        return elementTail == "*"
    }
    
    private func parseStringSchemaElement(elementID: Character) {
        stringArguments[elementID] = ""
    }
    
    private func parseBooleanSchemaElement(elementID: Character) {
        booleanArguments[elementID] = false
    }
    
    private func parseArguments() throws {
        for argument in arguments {
            try parseArgument(argument: argument)
        }
    }
    
    private func parseArgument(argument: String) throws {
        if argument.first == "-" {
            try parseElements(argument: argument)
        }
    }
    
    private func parseElements(argument: String) throws {
        for character in argument.dropFirst() {
            try parseElement(argumentCharacter: character)
        }
    }
    
    private func parseElement(argumentCharacter: Character) throws {
        if try setArgument(argumentCharacter) {
            argumentsFound.insert(argumentCharacter)
        } else {
            unexpectedArguments.add(argumentCharacter)
        }
    }
    
    private func setArgument (_ argumentCharacter: Character) throws -> Bool {
        var set = true
        if isBoolean(argumentCharacter: argumentCharacter) {
            setBooleanArg(argumentCharacter: argumentCharacter, value: true)
        } else if (isString(argumentCharacter: argumentCharacter)) {
            try setStringArgument(argumentCharacter: argumentCharacter, value: "")
        } else {
            set = false
        }
        return set
    }
    
    
    private func setBooleanArg(argumentCharacter: Character, value: Bool) {
        booleanArguments[argumentCharacter] = value
    }
    
    private func isBoolean(argumentCharacter: Character) -> Bool {
        return booleanArguments.keys.contains(argumentCharacter)
    }
    
    private func isString(argumentCharacter: Character) -> Bool {
        return stringArguments.keys.contains(argumentCharacter)
    }
    
    private func setStringArgument(argumentCharacter: Character, value: String) throws {
        currentArgument += 1
        guard currentArgument < arguments.count else {
            valid = false
            errorArgument = argumentCharacter
            throw ParseError.missingString(message: "Could not find string parameter for \(argumentCharacter)")
        }
        stringArguments[argumentCharacter] = arguments[currentArgument]
    }
    
    func cardinality() -> Int {
        return argumentsFound.count
    }
    
    func usage() -> String {
        return schema.isEmpty ? "" : "-[\(schema)]"
    }
    
    private func unexpectedArgumentMessage() -> String {
        var argumentString = ""
        for argument in unexpectedArguments {
            let character = argument as! Character
            argumentString.append(character)
        }
        return "Argument(s) -\(argumentString) unexpected."
    }
    
    func getBoolean(argument: Character) -> Bool {
        return booleanArguments[argument] ?? false
    }

}

extension Character {
    func isLetter() -> Bool {
        let letters = CharacterSet.letters
        return letters.contains(self.unicodeScalars.first!)
    }
}

