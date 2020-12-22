//
//  ViewController.swift
//  project2
//
//  Created by Mca Book PRO on 09.12.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["Estonia", "France", "Germany", "Ireland", "Italy"
                      ,"Monaco", "Nigeria", "Russia", "Spain", "US", "UK"]
        //button borders width!
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        //button border color!
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestions()
    }
    
    //set our image to the button field!
    func askQuestions(alert: UIAlertAction! = nil){
        //differently sort our array!
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }
    
    //Simple game logic!
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        
        //Alert on the center of the screen!
        let ac = UIAlertController(title: title,
                                   message: "Your score is \(score)", preferredStyle: .alert)
        //Adding a button "Continue" to our alert!
        ac.addAction(UIAlertAction(title: "Continue",
                                   //handler choose the option
                                   //which will work after "Coninue" will teped!
                    style: .default, handler: askQuestions))
        
        present(ac, animated: true)
    }
    


}

