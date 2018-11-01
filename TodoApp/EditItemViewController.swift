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
        TaskLists.incomplete.remove(at: rowNumber)
        let editTask: [String:String] = ["title": taskName.text!, "description": taskDescription.text!]
        TaskLists.incomplete.append(editTask)
        navigationController?.popViewController(animated: true)
    }
}
