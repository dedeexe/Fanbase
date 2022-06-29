import Foundation

struct Actor {
    let name: String
    let image: String
}

#if DEBUG
extension Actor {
    static func fixture(
        name: String = "Someone",
        image: String = ""
    ) -> Actor {
        Actor(name: name, image: image)
    }
}
#endif
