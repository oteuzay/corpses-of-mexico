import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        imageToLoad(selectedImage: selectedImage)
    }
    
    private func configureNavigation() -> Void {
        self.title = "Picture"
    }
    
    private func imageToLoad(selectedImage: String?) -> Void {
        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }
    }
}
