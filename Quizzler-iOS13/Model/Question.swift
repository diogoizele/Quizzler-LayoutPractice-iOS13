//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Diogo Gabriel Izele on 12/12/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answers: [String]
    let correctAnswer: String
    
    init(question: String, answers: [String], correctAnswer: String) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}

