import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "Radar Service!"
    }
    
    // Example of configuring a controller
    let nodesController = NodeController()
    router.get("nodes", use: nodesController.index)
    router.post("nodes", use: nodesController.create)
    router.delete("todos", Beacon.parameter, use: nodesController.delete)
    
    // Example of configuring a controller
    let taskController = TasksController()
    router.get("task", use: taskController.index)
    router.post("task", String.parameter, use: taskController.create)
    router.delete("todos", Beacon.parameter, use: taskController.delete)

    
}
