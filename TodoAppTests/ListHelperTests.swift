import XCTest
@testable import TodoApp

class ListHelperTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        TaskLists.complete = []
        TaskLists.incomplete = []
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_addNewComplete() {
        ListHelper.addTask(["title": "Clean house", "description": "Deep clean the whole house today"], to: ListHelper.ListTypes.complete)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        XCTAssert(
            (TaskLists.complete[0]["title"] == "Clean house") &&
            (TaskLists.complete[0]["description"] == "Deep clean the whole house today") &&
            (dateFormatter.date(from: TaskLists.complete[0]["time"]!) != nil)
        )
    }
    
    func test_addNewIncomplete() {
        ListHelper.addTask(["title": "Clean house", "description": "Deep clean the whole house today"], to: ListHelper.ListTypes.incomplete)
        XCTAssert(TaskLists.incomplete.contains(["title": "Clean house", "description": "Deep clean the whole house today"]))
    }
    
    func test_removeIncomplete() {
        let task = ["title": "Clean house", "description": "Deep clean the whole house today"]
        ListHelper.addTask(task, to: ListHelper.ListTypes.incomplete)
        
        ListHelper.removeTask(task, from: .incomplete)
        
        XCTAssert(!TaskLists.incomplete.contains(task))
    }
    
    func test_transferTaskFromIncToCom() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let task = ["title": "Clean house", "description": "Deep clean the whole house today"]
        ListHelper.addTask(task, to: ListHelper.ListTypes.incomplete)
        ListHelper.transferTask(task, from: .incomplete, to: .complete)
        
        XCTAssert(
            (!TaskLists.incomplete.contains(task)) &&
            (TaskLists.complete[0]["title"] == "Clean house") &&
            (TaskLists.complete[0]["description"] == "Deep clean the whole house today") &&
            (dateFormatter.date(from: TaskLists.complete[0]["time"]!) != nil)
        )
    }
    
    func test_transferTaskFromComToInc() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let task = ["title": "Clean house", "description": "Deep clean the whole house today"]
        ListHelper.addTask(task, to: ListHelper.ListTypes.complete)
        let newTask = TaskLists.complete[0]
        ListHelper.transferTask(newTask, from: .complete, to: .incomplete)
        
        XCTAssert(
            (!TaskLists.complete.contains(newTask)) &&
            (TaskLists.incomplete.contains(task))
        )
    }

}
