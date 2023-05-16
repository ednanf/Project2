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
    // Keeps track of how many questions the player answered (part of CHALLENGE 2).
    var answeredQuestions = 0
    
    
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
        
        askQuestion(action: nil) // nil because there's not UIAlertAction for this specific call.
        
    }

    
// MARK: - IBActions
    
    // IBAction is a way of making storyboard layouts trigger code.
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        let number = sender.tag
                                                                                // .tag was defined in the property inspector in Storyboard.
        if number == correctAnswer {                                            // If the tag number matches the correctAnswer (set in askQuestion()),
            title = "Correct!"                                                  // set the title
            score += 1                                                          // add 1 to the score,
        } else {                                                                // else,
            // ***CHALLENGE 3***
            title = "Wrong! That's the flag of \(countries[number].uppercased())"
            score -= 1                                                          // remove 1 from the score.
        }
        
        // ***Part of CHALLENGE 2***
        answeredQuestions += 1
        
        // Alert prompt
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        // ***CHALLENGE 2***
        if answeredQuestions <= 9 {
            // Presents the regular alert prompt
            present(ac, animated: true)
        } else {
            // Presents the final alert prompt + sets up a new match.
            finishedGame()
        }
    }
    
// MARK: - Functions

    // Show 3 random flags
    func askQuestion(action: UIAlertAction!) {
        // Randomize the flags that will be added to the buttons.
        countries.shuffle()
        
        // button.setImage assigns a UIImage to the button. The image's name is the position in the array.
        // for: .normal means the button's state that should be changed is the standard state of the button.
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        // Defines the correct answer.
        correctAnswer = Int.random(in: 0...2)
        
        // Sets the navigation bar's title to the "correct answer" so the player know which flag they need to tap.
        // ***CHALLENGE 1*** - Show the score in the navigation bar
        title = "Which is the flag of \(countries[correctAnswer].uppercased())? | Score: \(score)"
    }
    
    // ***Part of CHALLENGE 2***
    func finishedGame() {
        
            let alertFinished = UIAlertController(title: "Finished", message: "Your final score is \(score)", preferredStyle: .alert)
            alertFinished.addAction(UIAlertAction(title: "Restart", style: .default))
            present(alertFinished, animated: true)
            
            score = 0
            
            answeredQuestions = 0
    }
    
    
}

