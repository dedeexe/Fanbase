import Foundation

struct Actor {
    let name: String
    let imagePath: String
    let description: String
}

#if DEBUG
extension Actor {
    static func fixture(
        name: String = "Someone",
        imagePath: String = "",
        description: String? = nil
    ) -> Actor {
        Actor(
            name: name,
            imagePath: imagePath,
            description: description ?? String(repeating: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ", count: 10)
        )
    }

    static var daveedDiggs: Actor {
        .fixture(
            name: "Daveed Diggs",
            imagePath: "ddiggs"
        )
    }

    static var mickeySumner: Actor {
        .fixture(
            name: "Mickey Sumner",
            imagePath: "sumner"
        )
    }

    static var jenniferConnelly: Actor {
        .fixture(
            name: "Jennifer Connelly",
            imagePath: "jconnelly"
        )
    }

    static var alisonWright: Actor {
        .fixture(
            name: "Alison Wright",
            imagePath: "awright"
        )
    }

    static var robertoUrbina: Actor {
        .fixture(
            name: "Roberto Urbina",
            imagePath: "rurbina"
        )
    }
}
#endif
