//
//  Model.swift
//  TheQuizinator
//
//  Created by Aaron on 11/7/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit


struct Questions {

    let pool = [["Question":"This was the only US President to serve more than two consecutive terms", "Option1":"George Washington", "Option2":"Franklin D. Roosevelt", "Option3":"Woodrow Wilson", "Option4":"Andrew Jackson", "Answer":"2"], ["Question":"Which of the following countries has the most residents?", "Option1":"Nigeria","Option2":"Russia", "Option3":"Iran", "Option4":"Vietnam", "Answer":"1"], ["Question":"In what year was the United Nations founded?", "Option1":"1918", "Option2":"1919", "Option3":"1945", "Option4":"1954", "Answer":"3"], ["Question":"The Titanic departed from the United Kingdom. Where was it supposed to arrive?", "Option1":"Paris", "Option2":"Washington D.C.", "Option3":"New York City", "Option4":"Boston", "Answer":"3"], ["Question":"Which nation produces the most oil?", "Option1":"Iran", "Option2":"Iraq", "Option3":"Brazil", "Option4":"Canada", "Answer":"4"], ["Question":"Which of the following rivers is longest?", "Option1":"Yangtze", "Option2":"Mississippi", "Option3":"Congo", "Option4":"Mekong", "Answer":"2"], ["Question":"Which city is the oldest?", "Option1":"Mexico City", "Option2":"Cape Town", "Option3":"San Juan", "Option4":"Sydney", "Answer":"1"], ["Question":"Which country was the first to allow women to vote in national elections?", "Option1":"Poland", "Option2":"United States", "Option3":"Sweden", "Option4":"Senegal", "Answer":"1"], ["Question":"Which of these countries won the most medals in the 2012 Summer Games?", "Option1":"France", "Option2":"Germany", "Option3":"Japan", "Option4":"Great Britian", "Answer":"4"], ["Question":"Which country has most recently won consecutive World Cups in Soccer?", "Option1":"Italy", "Option2":"Brazil", "Option3":"Argetina", "Option4":"Spain", "Answer":"2"]]

}

class QuestionManager {
    
    struct Question {
        let question: String
        let possibleAnswer1: String
        let possibleAnswer2: String
        let possibleAnswer3: String
        let possibleAnswer4: String
        let answer: String
     
    }
    
    
    
    let q1 = Question(question: "This was the only US President to serve more than two consecutive terms.", possibleAnswer1: "George Washington", possibleAnswer2: "Franklin D. Roosevelt", possibleAnswer3: "Woodrow Wilson", possibleAnswer4: "Andrew Jackson", answer: "2")
    let q2 = Question(question: "Which of the following countries has the most residents?", possibleAnswer1: "Nigeria", possibleAnswer2: "Russia", possibleAnswer3: "Iran", possibleAnswer4: "Vietnam", answer: "1")
    let q3 = Question(question: "In what year was the United Nations founded?", possibleAnswer1: "1918", possibleAnswer2: "1919", possibleAnswer3: "1945", possibleAnswer4: "1954", answer: "3")
    let q4 = Question(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", possibleAnswer1: "Paris", possibleAnswer2: "Washington D.C.", possibleAnswer3: "New York City", possibleAnswer4: "Boston", answer: "3")
    let q5 = Question(question: "Which nation produces the most oil?", possibleAnswer1: "Iran", possibleAnswer2: "Iraq", possibleAnswer3: "Brazil", possibleAnswer4: "Canada", answer: "4")
    let q6 = Question(question: "Which country has most recently won consecutive World Cups in Soccer?", possibleAnswer1: "Italy", possibleAnswer2: "Brazil", possibleAnswer3: "Argentina", possibleAnswer4: "Spain", answer: "2")
    let q7 = Question(question: "Which of the following rivers is longest?", possibleAnswer1: "Yangtze", possibleAnswer2: "Mississippi", possibleAnswer3: "Congo", possibleAnswer4: "Mekong", answer: "2")
    let q8 = Question(question: "Which city is the oldest?", possibleAnswer1: "Mexico City", possibleAnswer2: "Cape Town", possibleAnswer3: "San Juan", possibleAnswer4: "Sydney", answer: "1")
    let q9 = Question(question: "Which country was the first to allow women to vote in national elections?", possibleAnswer1: "Poland", possibleAnswer2: "United States", possibleAnswer3: "Sweden", possibleAnswer4: "Senegal", answer: "1")
    let q10 = Question(question: "Which of these countries won the most medals in the 2012 Summer Games?", possibleAnswer1: "France", possibleAnswer2: "Germany", possibleAnswer3: "Japan", possibleAnswer4: "Great Britain", answer: "4")
    
   
    
    let questionsPerRound = 10
    var questionsAsked = 0
    var correctQuestions = 0
    var questionArray = [Question]()
    var shuffledArray = [Question]()

    var timeToResetValues: Bool = true
    
    init() {

        self.questionArray = [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10]
        
    }
    
    func shuffleArray() {
        shuffledArray = questionArray.shuffled()
    }
    
    func dataToController() -> Question {
        let returnedValue = shuffledArray[questionsAsked]
        return returnedValue
    }

    
    func checkTheAnswer(buttonInput: Int) -> String {
        
        // Increment the questions asked counter
        

        if (buttonInput == 1 && shuffledArray[questionsAsked].answer == "1") {
            correctQuestions += 1
            questionsAsked += 1
            return "Correct!"
            

        } else if (buttonInput == 2 && shuffledArray[questionsAsked].answer == "2") {
            correctQuestions += 1
            questionsAsked += 1
            return "Correct!"
            

        } else if (buttonInput == 3 && shuffledArray[questionsAsked].answer == "3") {
            correctQuestions += 1
            questionsAsked += 1
            return "Correct!"
            

        } else if (buttonInput == 4 && shuffledArray[questionsAsked].answer == "4") {
            correctQuestions += 1
            questionsAsked += 1
            return "Correct!"
        } else {
            questionsAsked += 1
            return "Incorrect!"
            
        }

        
    }
    
        func resetValues() {
            self.questionsAsked = 0
            self.correctQuestions = 0
            self.timeToResetValues = false
        }
    
    func nextQuestionOrEndQuiz() -> Bool {
//          at the end of the round this one is true
        if questionsAsked == questionsPerRound && timeToResetValues == false {
            timeToResetValues = true
            return true
//          When user hits 'try again' this one becomes true
        }  else if questionsAsked == questionsPerRound && timeToResetValues == true {
            resetValues()
            shuffleArray()
            return false
//            At inital beginning of game this one is true
        } else if questionsAsked != questionsPerRound && timeToResetValues == true {
            resetValues()
            shuffleArray()
            return false
//  Throughout round this statement
    } else {
            
            return false
        }
    }

}


