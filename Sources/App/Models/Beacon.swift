import FluentSQLite
import Vapor

/// A single entry of a Beacon list.
final class Beacon: SQLiteModel {
    var id: Int?
    let identifier: String
    ///Уникальный идентификатор группы маяков, определяющий их тип или принадлежность одной организации
    let uuid: String
    ///Значение, с помощью которого можно группировать маяки с одинаковым UUID
    let major: UInt16
    ///значение, с помощью которого можно группировать маяки с одинаковым UUID и Major
    let minor: UInt16

    init(id: Int?, identifier: String, uuid: String, major: UInt16, minor: UInt16) {
        self.identifier = identifier
        self.uuid = uuid
        self.major = major
        self.minor = minor
    }
}

extension Beacon: Migration { }

extension Beacon: Content { }

extension Beacon: Parameter { }
