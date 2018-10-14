import UIKit

class Pet: NSObject {
    
    var name: String
    var species: String
    
    init(name: String, species: String) {
        (self.name, self.species) = (name, species)
    }
}
