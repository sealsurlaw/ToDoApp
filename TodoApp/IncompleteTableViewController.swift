import UIKit

class IncompleteTableViewController: UITableViewController {
    
    var selectedTask: [String:String]!
    var selectedRow: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskLists.incomplete.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = TaskLists.incomplete[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "incompleteCell") as! IncompleteTableViewCell
        
        cell.task = TaskLists.incomplete[indexPath.row]
        cell.controller = self
        cell.textLabel?.text = item["title"]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTask = TaskLists.incomplete[indexPath.row]
        selectedRow = indexPath.row
        performSegue(withIdentifier: "editSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditItemViewController {
            destination.task = selectedTask
            destination.rowNumber = selectedRow
        }
    }
}

