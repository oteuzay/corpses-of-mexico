import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        loadPictures()
    }
    
    func configureNavigation() -> Void {
        self.title = "Corpses of Mexico"
    }
    
    func loadPictures() -> Void {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let pictures = try! fm.contentsOfDirectory(atPath: path)
        
        for picture in pictures {
            if picture.hasSuffix(".jpeg") || picture.hasSuffix(".jpg") {
                self.pictures.append(picture)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
}
