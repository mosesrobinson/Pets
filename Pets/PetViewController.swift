import UIKit

class PetViewController: UIViewController {

    var pet: Pet?
    var petController: PetController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var speciesField: UITextField!
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        // code to apply whats in text feilds and go back to table view controller
        
        guard let name = nameField.text,
            let species = speciesField.text else { return }
        
        if let pet = pet {
            
            petController?.updatePet(pet: pet, name: name, species: species)
            
        } else {
            petController?.createPet(name: name, species: species)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    
    private func updateView() {
        guard let pet = pet else { return }
        
        title = pet.name
        nameField.text = pet.name
        speciesField.text = pet.species
        
    }
    
}

