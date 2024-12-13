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
    
    @IBOutlet weak var numberWords: UITextField!
    var listeMots: [Mot] = []
    var numberOfQuestions: Int = 0
    
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
            frWordInput.text = ""
            enWordInput.text = ""
        }
    }
    
    
    @IBAction func play(_ sender: UIButton) {
        print("Nombre de questions: \(numberOfQuestions) \nListe des mots: \(listeMots) \nQuestion en français: \(questionFraAng.isOn) \nQuestion en anglais: \(questionAngFra.isOn)")
    }
    
}

