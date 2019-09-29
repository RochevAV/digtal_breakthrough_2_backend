import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class TasksController {
    
    func index(_ req: Request) throws -> Future<[Task]> {
        return Task.query(on: req).all()
    }
    
    func task(_ req: Request) throws -> Future<Task?> {
        
        let task = Task(id: 123, identifier: "", details: [""])
        return Task.query(on: req).first()
    }
    
    func create(_ req: Request) throws -> Future<Task> {
        return try req.content.decode(Task.self).flatMap { task in
            return task.save(on: req)
        }
    }
    
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Task.self).flatMap { beacon in
            return beacon.delete(on: req)
        }.transform(to: .ok)
    }
}
