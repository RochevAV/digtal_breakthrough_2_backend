import FluentSQLite
import Vapor

/// A single entry of a Beacon list.
final class Task: SQLiteModel {
    var id: Int?
    let identifier: String
    let details: [String]

    init(id: Int?, identifier: String, details: [String]) {
        self.identifier = identifier
        self.details = details
    }
}

extension Task: Migration { }

extension Task: Content { }

extension Task: Parameter { }
