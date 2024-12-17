//
//  vcResultat2.swift
//  Quiz
//
//  Created by Mamoudou DIALLO on 17/12/2024.
//

import UIKit

class vcResultat2: UIViewController {

    
    @IBOutlet weak var quizzTitre: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    var score: Int = 0
    var questions: Int = 0
    var titre: String = ""
    var listeMots: [Mot] = []
    var choice: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("score: \(score)")
        print("questions: \(questions)")
        print("titre: \(titre)")
        
        quizzTitre.text = titre
        scoreLabel.text = "Score = \(score)/\(questions)"
        
        let etoiles = calculerEtoiles(score: score, totalQuestions: questions)
        
        img.image = UIImage(named: "etoile\(etoiles)")
        

        // Do any additional setup after loading the view.
    }
    
    
    func calculerEtoiles(score: Int, totalQuestions: Int) -> Int {
        if totalQuestions == 0 { return 0 }
        
        let etoiles = Double(score) * 5.0 / Double(totalQuestions)
        return Int(round(etoiles))
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "replay" {
            if let vcQuestions2 = segue.destination as? vcQuestions2 {
                vcQuestions2.choice = choice
                vcQuestions2.titre = titre
                vcQuestions2.listeMots = listeMots
                vcQuestions2.numberOfQuestions = questions
            }
        }
    }
    
    
    
    @IBAction func replay(_ sender: Any) {
        performSegue(withIdentifier: "replay", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
