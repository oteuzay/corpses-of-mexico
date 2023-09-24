import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        self.pictures = FileOperator().getFiles(fileTypes: [".jpeg", ".jpg"])
    }
    
    func configureNavigation() -> Void {
        self.title = "Corpses of Mexico"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        var config = cell.defaultContentConfiguration()
        
        config.text = pictures[indexPath.row]
        cell.contentConfiguration = config

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            vc.selectedImage = self.pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
