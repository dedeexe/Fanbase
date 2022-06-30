import Foundation

struct Movie {
    let title: String
    let staff: [Actor]
}

#if DEBUG
extension Movie {
    static func fixture(
        title: String = "The Movie",
        staff: [Actor] = [.daveedDiggs, .alisonWright, .jenniferConnelly, .mickeySumner, .robertoUrbina],
        shuffled: Bool = true
    ) -> Movie {
        Movie(
            title: title,
            staff: shuffled ? staff.shuffled() : staff
        )
    }
}
#endif
