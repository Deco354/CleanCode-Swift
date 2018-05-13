import Foundation

enum ParseError: Error, Equatable, LocalizedError {
    case missingString(message: String)
    case badCharacter(message: String)
    case unexpectedArgument(message: String)
}

extension ParseError {
    var errorDescription: String? {
        
        switch self {
        case let .missingString(message):
            return message
        case let .badCharacter(message):
            return message
        case let .unexpectedArgument(message):
            return message
        }
    }
}
