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
    router.get("allTasks") { req in
           return "\"items\": [{ \"identifier\": \"1234\", \"details\": [ \"Болт большой\", \"Ступица\", \"Колесо\" ] }, { \"identifier\": \"123\", \"details\": [ \"Микросхемки там какие-то\", \"Верни отвертку\", \"Зайди на обед к Петру, у него есть разговор\"] }]"
    }
    router.post("task", String.parameter, use: taskController.create)
    router.delete("todos", Beacon.parameter, use: taskController.delete)

    
}
