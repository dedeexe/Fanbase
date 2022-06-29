import Foundation

struct Movie {
    let title: String
    let staff: [Actor]
}

#if DEBUG
extension Movie {
    static func fixture(
        title: String = "The Movie",
        staff: [Actor] = [.fixture(), .fixture(), .fixture(), .fixture(), .fixture()]
    ) -> Movie {
        Movie(title: title, staff: staff)
    }
}
#endif
