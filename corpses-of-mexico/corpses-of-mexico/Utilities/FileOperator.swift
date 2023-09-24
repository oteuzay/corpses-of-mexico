import Foundation

class FileOperator {
    
    private var files = [String]()
    
    func getFiles(fileTypes: [String]) -> [String] {
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let files = try! fm.contentsOfDirectory(atPath: path)
        
        for file in files {
            for fileType in fileTypes {
                if file.hasSuffix(fileType) {
                    self.files.append(file)
                }
            }
        }
        
        self.files.sort()
        
        return self.files
    }
}
