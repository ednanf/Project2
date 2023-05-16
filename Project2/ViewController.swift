//
//  ViewController.swift
//  Project2
//
//  Created by Ednan R. Frizzera Filho on 15/05/23.
//

import UIKit

class ViewController: UIViewController {

// MARK: - IBOutlets
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    
// MARK: - Properties
    
    var countries: [String] = []
    var score = 0
    // Flags 0, 1 or 2 will be the correct answer
    var correctAnswer = 0
    
    
// MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Populate the array with countries -- the names matches the filenames.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        // Adds a border to the flags so the black/white won't blend into the background.
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        // Changes the border's color
        // CALayer doesn't understand UIColor because it's on a lower level. However, it understands CGColor (Core Graphics).
        // UIColor.lightGray sets the color to light gray, and .cgColor converts that value so CAlayer can understand.
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }

    
// MARK: - Functions

    // Show 3 random flags
    func askQuestion() {
        // Randomize the flags that will be added to the buttons.
        countries.shuffle()
        
        // button.setImage assigns a UIImage to the button. The image's name is the position in the array.
        // for: .normal means the button's state that should be changed is the standard state of the button.
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        // Defines the correct answer.
        correctAnswer = Int.random(in: 0...2)
        
        // Sets the title to the "correct answer" so the player know which flag they need to tap.
        title = countries[correctAnswer].uppercased()
    }
    
    
}

