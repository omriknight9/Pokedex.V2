
import UIKit

class PokemonDetailVC: UIViewController {
    
    
    @IBOutlet weak var mainImg: UIImageView!;
    @IBOutlet weak var descriptionLbl: UILabel!;
    @IBOutlet weak var nameLbl: UILabel!;
    @IBOutlet weak var typeLbl: UILabel!;
    @IBOutlet weak var defenseLbl: UILabel!;
    @IBOutlet weak var heightLbl: UILabel!;
    @IBOutlet weak var weightLbl: UILabel!;
    @IBOutlet weak var attackLbl: UILabel!;
    @IBOutlet weak var pokedexLbl: UILabel!;
    @IBOutlet weak var currentEvoImg: UIImageView!;
    @IBOutlet weak var nextEvoImg: UIImageView!;
    @IBOutlet weak var evoLbl: UILabel!;
    
    var pokemon: Pokemon!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name.capitalized;
        let img = UIImage(named: "\(pokemon.pokedexId)");
        mainImg.image  = img;
        currentEvoImg.image = img;
        
        pokemon.downloadPokemonDetails {
            self.updateUI();
        }
        
    }
    
    func updateUI(){
        descriptionLbl.text = pokemon.description;
        typeLbl.text = pokemon.type;
        defenseLbl.text = pokemon.defense;
        heightLbl.text = pokemon.height;
        weightLbl.text = pokemon.weight;
        attackLbl.text = pokemon.attack;
        pokedexLbl.text = "\(pokemon.pokedexId)";
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolution"
            nextEvoImg.isHidden = true;
        }else{
            nextEvoImg.isHidden = false;
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId);
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)";
            
            if pokemon.nextEvolutionLvl != "" {
                str += " - LVL \(pokemon.nextEvolutionLvl)";
                
                evoLbl.text = str;
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil);
    }
    
}






