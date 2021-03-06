//
//  ViewController.swift
//  TheQuizinator
//
//  Created by Aaron Haughton on 3/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
  
    // MARK: - Outlets
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlaySounds.loadGameStartSound()
        PlaySounds.playGameStartSound()
        
        nextRound()
        
     }
    
    let questionManager = QuestionManager.init()
    

    func displayQuestion() {
        let datafromModel = questionManager.fetchQuestion()
        questionField.text = datafromModel.question
        option1.setTitle(datafromModel.possibleAnswer1, for: .normal)
        option2.setTitle(datafromModel.possibleAnswer2, for: .normal)
        option3.setTitle(datafromModel.possibleAnswer3, for: .normal)
        option4.setTitle(datafromModel.possibleAnswer4, for: .normal)
        playAgainButton.isHidden = true
        showOptionButtons()
    }
    
    func hideOptionButtons() {
        option1.isHidden = true
        option2.isHidden = true
        option3.isHidden = true
        option4.isHidden = true
    }
    
    func showOptionButtons() {
        option1.isHidden = false
        option2.isHidden = false
        option3.isHidden = false
        option4.isHidden = false
        
    }

    func nextRound() {
        let doesQuizEnd = questionManager.nextQuestionOrEndQuiz()
        if doesQuizEnd == true {
            displayScore()
        } else { 
            displayQuestion()
        }
    }
    
    func displayScore() {
        // Hide the answer buttons
       hideOptionButtons()
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(questionManager.correctQuestions) out of \(questionManager.questionsPerRound) correct!"
        
    }
   
    
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    // MARK: - Actions
    
    
    @IBAction func retrieveTheAnswer(_ sender: UIButton) {

        switch sender {
        case option1: questionField.text = questionManager.checkTheAnswer(buttonInput: 1)
        case option2: questionField.text = questionManager.checkTheAnswer(buttonInput: 2)
        case option3: questionField.text = questionManager.checkTheAnswer(buttonInput: 3)
        case option4: questionField.text = questionManager.checkTheAnswer(buttonInput: 4)
        default: break
        }
        loadNextRound(delay: 2)
    }
    

    
    @IBAction func playAgain(_ sender: UIButton) {
        // Show the answer buttons
        nextRound()
        
    }
    

}

