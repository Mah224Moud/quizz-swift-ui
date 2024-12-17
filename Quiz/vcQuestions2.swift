//
//  vcQuestions.swift
//  Quiz
//
//  Created by Mamoudou DIALLO on 13/12/2024.
//

import UIKit

class vcQuestions2: UIViewController {
    
    @IBOutlet weak var mainStatus: UILabel!
    
    @IBOutlet weak var mainTitle: UILabel!
    
    var listeMots: [Mot] = []
    var listeMotsOriginal: [Mot] = []
    var numberOfQuestions: Int = 0
    var titre: String = ""
    var currentQuestion: Int = 0
    var choice: String = ""
    var anwer: String = ""
    var score : Int = 0
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var userTranslation: UITextField!
    @IBOutlet weak var translation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            print("Liste des mots: \(listeMots)")
            print("Nombre de questions: \(numberOfQuestions)")
            print("Titre: \(titre)")
            print("Voici le choix reçu: \(choice)")
        mainTitle.text = titre
        listeMotsOriginal = listeMots
        if !listeMots.isEmpty {
            updateQuestion()
        }

    }
    
    

    @IBAction func nextQuestion(_ sender: Any) {
        if let userTranslation = userTranslation.text {
            print("userTranslation: \(userTranslation)")
            if userTranslation == anwer {
                score += 1
                img.image = UIImage(named: "vrai")
            } else {
                img.image = UIImage(named: "faux")
            }
        }
        userTranslation.text = ""
        if listeMots.isEmpty {
            performSegue(withIdentifier: "vcResultat2", sender: nil)
            print("Il n'y a plus de questions donc on affiche le resultat")
        }else{
            listeMots.remove(at: 0)
            if !listeMots.isEmpty {
                updateQuestion()
            }else {
                performSegue(withIdentifier: "vcResultat2", sender: nil)
                print("Il n'y a plus de questions donc on affiche le resultat")
            }
        }
        
        
    }
    
    func updateQuestion() {
        currentQuestion += 1
        mainStatus.text = "\(currentQuestion)/\(numberOfQuestions)"
        if choice  == "fr" {
            translation.text = "Traduire \(listeMots[0].fr)"
            anwer = listeMots[0].en
        }else if choice == "en" {
            translation.text = "Translate \(listeMots[0].en)"
            anwer = listeMots[0].fr
        }else {
            let isFrench = Bool.random()

                if isFrench {
                    translation.text = "Traduire \(listeMots[0].fr)"
                    anwer = listeMots[0].en
                } else {
                    translation.text = "Translate \(listeMots[0].en)"
                   anwer = listeMots[0].fr
                }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vcResultat2" {
            if let vcResultat2 = segue.destination as? vcResultat2 {
                vcResultat2.score = score
                vcResultat2.titre = titre
                vcResultat2.questions = numberOfQuestions
                vcResultat2.choice = choice
                vcResultat2.listeMots = listeMotsOriginal
            }
        }
    }
    
    
    
    @IBAction func replay(_ sender: Any) {
        currentQuestion = 0
            score = 0
            img.image = nil
            userTranslation.text = ""
            
            // Rétablir la liste des mots
            listeMots = listeMotsOriginal
            
            // Réinitialiser l'affichage
            mainStatus.text = "\(currentQuestion)/\(numberOfQuestions)"
            updateQuestion()
            
            print("Le jeu a été réinitialisé")
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
