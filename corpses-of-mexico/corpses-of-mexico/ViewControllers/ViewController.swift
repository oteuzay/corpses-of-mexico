import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        self.pictures = FileOperator().getFiles(fileFormats: [".jpeg", ".jpg"])
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
        
        if let (name, format) = 🪚(📁: pictures[indexPath.row]) {
            config.text = name
            config.secondaryText = "File Format: .\(format)"
        } else {
            config.text = "Unknown"
            config.textProperties.color = .red
        }
        
        cell.contentConfiguration = config
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            vc.selectedImage = self.pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    func 🪚(📁: String) -> (String, String)? {
        let components = 📁.components(separatedBy: ".")
        
        guard components.count == 2 else {
            return nil
        }
        
        return (components[0], components[1])
    }
}
