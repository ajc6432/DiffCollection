import Foundation

struct Contact: Hashable {
    let name: String
}

struct ContactList {
    var friends: [Contact]
    var family: [Contact]
    var coworkers: [Contact]
}
