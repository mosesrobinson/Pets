import UIKit

class PetsTableViewController: UITableViewController {
    
    var petController = PetController()

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return petController.pets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let pet = petController.pets[indexPath.row]
        cell.textLabel?.text = "\(pet.name)" + " " + "my pet" + " " + "\(pet.species)"

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addPet" {
            guard let petViewController = segue.destination as? PetViewController else { return }
            
            petViewController.petController = petController
        } else if segue.identifier == "savedPet" {
            
            guard let petViewController = segue.destination as? PetViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            
            petViewController.petController = petController
            petViewController.pet = petController.pets[indexPath.row]
            
        }
    }
}
