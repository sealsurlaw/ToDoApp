import UIKit

class IncompleteTableViewCell: UITableViewCell {
    
    var task: [String:String]!
    var controller: UITableViewController!
    
    @IBOutlet weak var markCompleteButton: UIButton!
    
    @IBAction func markCompleteButtonPressed(_ sender: UIButton) {
        ListHelper.transferTask(task, from: .incomplete, to: .complete)
        controller.tableView.reloadData()
    }
    
    
}
