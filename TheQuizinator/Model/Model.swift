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
    
    let questionsPerRound = 2
    var questionsAsked = 0
    var correctQuestions = 0
    var questionsAlreadyAsked = [Int]()
    var indexOfSelectedQuestion = 1
    var question: String
    var option1: String
    var option2: String
    var option3: String
    var option4: String
    var answer: String
    var selectedQuestionDict = [String:String]()
    var timeToResetValues: Bool = false
    
    init() {
        
        self.selectedQuestionDict = Questions.init().pool[indexOfSelectedQuestion]
        self.question = selectedQuestionDict["Question"]!
        self.option1 = selectedQuestionDict["Option1"]!
        self.option2 = selectedQuestionDict["Option2"]!
        self.option3 = selectedQuestionDict["Option3"]!
        self.option4 = selectedQuestionDict["Option4"]!
        self.answer = selectedQuestionDict["Answer"]!

        
    }
    
    func generateIndex() {
                indexOfSelectedQuestion = Int.random(in: 0...Questions.init().pool.count - 1)
                for numbers in questionsAlreadyAsked {
                    if indexOfSelectedQuestion == numbers {
                       generateIndex()
        
                    }
                }
                self.questionsAlreadyAsked.append(indexOfSelectedQuestion)
            // Updates Question Values
            selectedQuestionDict = Questions.init().pool[indexOfSelectedQuestion]
            self.question = selectedQuestionDict["Question"]!
            self.option1 = selectedQuestionDict["Option1"]!
            self.option2 = selectedQuestionDict["Option2"]!
            self.option3 = selectedQuestionDict["Option3"]!
            self.option4 = selectedQuestionDict["Option4"]!
            self.answer = selectedQuestionDict["Answer"]!
            }

    func checkTheAnswer(buttonInput: Int) -> String {
        
        // Increment the questions asked counter
        questionsAsked += 1

        if (buttonInput == 1 && self.answer == "1") {
            correctQuestions += 1
            return "Correct!"

        } else if (buttonInput == 2 && self.answer == "2") {
            correctQuestions += 1
            return "Correct!"

        } else if (buttonInput == 3 && self.answer == "3") {
            correctQuestions += 1
            return "Correct!"

        } else if (buttonInput == 4 && self.answer == "4") {
            correctQuestions += 1
            return "Correct!"
        } else {
            return "Incorrect!"
        }


    }
    
        func resetValues() {
            self.questionsAsked = 0
            self.correctQuestions = 0
            self.questionsAlreadyAsked = []
            self.timeToResetValues = false
        }
    
    func nextQuestionOrEndQuiz() -> Bool {
        if questionsAsked == questionsPerRound && timeToResetValues == false {
            timeToResetValues = true
            return true
        } else if questionsAsked == questionsPerRound && timeToResetValues == true {
            resetValues()
            return false
        } else {
            return false
        }
    }

}


