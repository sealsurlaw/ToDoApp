import UIKit

class IncompleteTableViewCell: UITableViewCell {
    
    var task: [String:String]!
    var controller: UITableViewController!
    
    @IBOutlet weak var markCompleteButton: UIButton!
    
    @IBAction func markCompleteButtonPressed(_ sender: UIButton) {
        var i: Int = 0
        for item in TaskLists.incomplete {
            if item == task {
                TaskLists.incomplete.remove(at: i)
            }
            i += 1
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        task["time"] = dateFormatter.string(from: Date())
        TaskLists.complete.append(task)
        controller.tableView.reloadData()
    }
    
    
}
