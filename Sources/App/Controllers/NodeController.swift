import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class NodeController {
    
    func index(_ req: Request) throws -> Future<[Beacon]> {
        return Beacon.query(on: req).all()
    }
    
    func create(_ req: Request) throws -> Future<Beacon> {
        return try req.content.decode(Beacon.self).flatMap { beacon in
            return beacon.save(on: req)
        }
    }
    
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Beacon.self).flatMap { beacon in
            return beacon.delete(on: req)
        }.transform(to: .ok)
    }
}
