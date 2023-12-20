//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Diogo Gabriel Izele on 12/12/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let title: String
    let answer: String
    
    init(_ title: String, _ answer: String) {
        self.title = title
        self.answer = answer
    }
}

