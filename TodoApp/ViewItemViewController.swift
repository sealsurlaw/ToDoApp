import UIKit

class ViewItemViewController: UIViewController {
    
    var rowNumber: Int!
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        let task = TaskLists.complete[rowNumber]
        taskLabel.text = task["title"]
        descLabel.text = task["description"]
        timeLabel.text = task["time"]
    }
}
