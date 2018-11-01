import Foundation

class ListHelper {
    
    enum ListTypes {
        case complete
        case incomplete
    }
    
    static func addTask(_ task: [String: String], to list: ListTypes) {
        var newTask = task
        if list == .complete {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.short
            dateFormatter.timeStyle = DateFormatter.Style.short
            newTask["time"] = dateFormatter.string(from: Date())
            TaskLists.complete.append(newTask)
        }
        else {
            TaskLists.incomplete.append(newTask)
        }
    }
    
    static func removeTask(_ task: [String: String], from list: ListTypes) {
        var i: Int = 0
        if list == .complete {
            for item in TaskLists.complete {
                if item == task {
                    TaskLists.complete.remove(at: i)
                }
                i += 1
            }
        }
        else {
            for item in TaskLists.incomplete {
                if item == task {
                    TaskLists.incomplete.remove(at: i)
                }
                i += 1
            }
        }
        
    }
    
    static func transferTask(_ task: [String: String], from src: ListTypes, to des: ListTypes) {
        removeTask(task, from: src)
        var newTask = task
        if src == .complete {
            newTask["time"] = nil
        }
        addTask(newTask, to: des)
    }
}
