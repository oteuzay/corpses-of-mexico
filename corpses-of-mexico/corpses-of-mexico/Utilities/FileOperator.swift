import Foundation

class FileOperator {
    
    private var files = [String]()
    
    func getFiles(fileFormats: [String]) -> [String] {
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let files = try! fm.contentsOfDirectory(atPath: path)
        
        for file in files {
            for fileFormat in fileFormats {
                if file.hasSuffix(fileFormat) {
                    self.files.append(file)
                }
            }
        }
        
        self.files.sort()
        
        return self.files
    }
}
