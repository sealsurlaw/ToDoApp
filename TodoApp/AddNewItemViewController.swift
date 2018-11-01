import UIKit

class AddNewItemViewController: UIViewController {
    
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var taskDescription: UITextField!

    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let newTask: [String:String] = ["title": taskName.text!, "description": taskDescription.text!]
        ListHelper.addTask(newTask, to: .incomplete)
        navigationController?.popViewController(animated: true)
    }
    
    
}
