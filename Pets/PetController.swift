import UIKit

class PetController {
    //THIS IS WHERE C.R.U.D. HAPPENS
    // CREATE, READ, UPDATE, DELETE
    
    private(set) var pets: [Pet] = []
    
    
    // CREATE
    func createPet(name: String, species: String) -> Pet {
        
        let newPet = Pet(name: name, species: species)
        pets.append(newPet)
        return newPet
    }
    
    
    //UPDATE
    func updatePet(pet: Pet, name: String, species: String) {
        
        if let index = pets.index(of: pet) {
            let change = pet
            change.name = name
            change.species = species
            
            pets.remove(at: index)
            pets.insert(change, at: index)
        }
    }
}
