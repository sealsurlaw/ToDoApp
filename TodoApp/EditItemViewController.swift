import UIKit

class EditItemViewController: UIViewController {
    var task: [String:String]!
    var rowNumber: Int!
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var taskDescription: UITextField!
    
    override func viewDidLoad() {
        taskName.text = task["title"]
        taskDescription.text = task["description"]
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        ListHelper.removeTask(task, from: .incomplete)
        let editTask: [String:String] = ["title": taskName.text!, "description": taskDescription.text!]
        ListHelper.addTask(editTask, to: .incomplete)
        navigationController?.popViewController(animated: true)
    }
}
