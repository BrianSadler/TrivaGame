//
//  TriviaQuestions.swift
//  Trivia Game
//
//  Created by Brian Sadler on 10/9/18.
//  Copyright © 2018 Brian Sadler. All rights reserved.
//

import Foundation

class TriviaQuestion {
    
    
    let question: String

    
    let answers: [String]
    

    
    let correctAnswerIndex: Int
    
    //computed property that returns the correct answer for the trivia game
    var correctAnswer: String {
        return answers[correctAnswerIndex]
        
    }
    
    init(question:String, answers:[String], correctAnswerIndex: Int) {
    self.correctAnswerIndex = correctAnswerIndex
    self.answers = answers
        self.question = question
    }

}
