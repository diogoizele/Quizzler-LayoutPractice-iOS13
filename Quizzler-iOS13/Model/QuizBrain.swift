
//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Diogo Gabriel Izele on 14/12/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//


import UIKit
import Foundation

struct QuizBrain {
    let allQuestions: [Question] = [
        Question("A slug's blood is green.", "True"),
        Question("Approximately one quarter of human bones are in the feet.", "True"),
        Question("The total surface area of two human lungs is approximately 70 square metres.", "True"),
        Question("In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", "True"),
        Question("In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", "False"),
        Question("It is illegal to pee in the Ocean in Portugal.", "True"),
        Question("You can lead a cow down stairs but not up stairs.", "False"),
        Question("Google was originally called 'Backrub'.", "True"),
        Question("Buzz Aldrin's mother's maiden name was 'Moon'.", "True"),
        Question("The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", "False"),
        Question("No piece of square dry paper can be folded in half more than 7 times.", "False"),
        Question("Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", "True")
    ]
    var questions: [Question] = []

    var questionNumber = 0
    var questionIndex = 0
    var totalQuestionsLength = 0
    var score = 0
    
    
    init() {
        totalQuestionsLength = self.allQuestions.count
    }
    
    mutating func resetGameState() {
        questions = self.allQuestions
        questionNumber = 0
        questionIndex = 0
        score = 0
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        let actualAnswer = questions[questionIndex].answer

        if actualAnswer == userAnswer {
            score += 1
        }
        
        return (actualAnswer == userAnswer)
    }
    
  
    mutating func removeQuestion() {
        let index = self.questionIndex
        
        if index < self.questions.count && !self.questions.isEmpty {
            self.questions.remove(at: index)
        }
    }
    
    func generationQuestionIndex() -> Int {
        var length = self.questions.count
        
        if length > 0 {
            length -= 1
        }
        
        let questionIndex = Int.random(in: 0...length)
        
        return questionIndex
    }
    
}
