    let arguments = try? Args(withSchema: "1,p#,d*", andArguments: CommandLine.arguments)
    let logging = arguments.getBoolean(argument: "l")
    //let port = arguments.getInt("p")
    //let directory = arguments.getString("d")
    print("Logging: \(logging)")

//do {
//    let arguments = try Args(withSchema: "1,p#,d*", andArguments: CommandLine.arguments)
//    let logging = arguments.getBoolean(argument: "l")
//    //let port = arguments.getInt("p")
//    //let directory = arguments.getString("d")
//    print("Logging: \(logging)")
//} catch {
//    print(error)
//}
