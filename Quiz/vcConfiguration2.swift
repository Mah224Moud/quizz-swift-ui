//
//  ViewController.swift
//  Quiz
//
//  Created by Mamoudou DIALLO on 13/12/2024.
//

import UIKit

class vcConfiguration2: UIViewController {

    @IBOutlet weak var questionFraAng: UISwitch!
    
    @IBOutlet weak var questionAngFra: UISwitch!
    
    @IBOutlet weak var frWordInput: UITextField!
    
    @IBOutlet weak var enWordInput: UITextField!
    
    @IBOutlet weak var numberOfWords: UILabel!
    
    @IBOutlet weak var titre: UITextField!
    
    var listeMots: [Mot] = []
    var numberOfQuestions: Int = 0
    var choices: [String: Bool] = [:]
    var choice: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func add(_ sender: UIButton) {
        let frWord = frWordInput.text?.isEmpty == false ? frWordInput.text : ""
        let enWord = enWordInput.text?.isEmpty == false ? enWordInput.text : ""
        
        if frWord == ""{
            print("Mot en français non renseigné")
        }
        if enWord == ""{
            print("Mot en anglais non renseigné")
        }
        
        if frWord != "" && enWord != "" {
            listeMots.append(Mot(fr: frWord!, en: enWord!))
            print("Ajouté: \(listeMots)")
            numberOfQuestions += 1
            numberOfWords.text = "\(numberOfQuestions)"
            frWordInput.text = ""
            enWordInput.text = ""
        }
    }
    
    
    @IBAction func play(_ sender: UIButton) {
        print("Nombre de questions: \(numberOfQuestions)\n\n\nListe des mots: \(listeMots)\n\n\nQuestion en français: \(questionFraAng.isOn)\n\n\nQuestion en anglais: \(questionAngFra.isOn)")
        
        if numberOfQuestions == 0 {
            print("Vous n'avez pas ajouté de mots")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vcQuestion2"{
            let vcQuestions2 = segue.destination as! vcQuestions2
            listeMots.shuffle()
            choices["fr"] = questionFraAng.isOn
            choices["en"] = questionAngFra.isOn
            choices["all"] = questionFraAng.isOn && questionAngFra.isOn
            print("Choix: \(choices)\n\n\n")
            func checkChoices(choices: [String: Bool]) -> String{
                if choices["all"]==true{
                    return "all"
                }else if choices["fr"]==true{
                    return "fr"
                }else{
                    return "en"
                }
            }
            
            choice = checkChoices(choices: choices)
            
            
            vcQuestions2.listeMots = listeMots
            vcQuestions2.numberOfQuestions = numberOfQuestions
            vcQuestions2.titre = titre.text?.isEmpty == false ? "Quizz \(titre.text!)": "Quizz"
            vcQuestions2.choice = choice
            
        }
    }
    
}

