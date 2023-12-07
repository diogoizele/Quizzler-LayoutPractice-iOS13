//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonTrue: UIButton!
    @IBOutlet weak var buttonFalse: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var questions: [[String]] = [
        ["Four + Two is equal to Six", "True"],
        ["Five - Three is greater than One", "True"],
        ["Three + Eight is less than Ten", "False"]
    ]

    var questionNumber = 0
    var questionIndex = 0
    var totalQuestions = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureButtonStyles()
        configureProgressBarStyle()
        
        questionIndex = generationQuestionIndex()
        totalQuestions = questions.count
        
        setText(getQuestion(questionIndex))
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        removeQuestion(questionIndex)
        
        questionNumber += 1
        questionIndex = generationQuestionIndex()
        
        if (questions.count > 0) {
            
            if (getQuestionResult(questionIndex) == "True") {
                print(getQuestionResult(questionIndex))
                score += 1
            }
            
            setText(getQuestion(questionIndex))
        }
        
        setProgress()
    }
    
    private func configureButtonStyles() {
        configureButton(buttonTrue)
        configureButton(buttonFalse)
    }
    
    private func configureButton(_ button: UIButton) {
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
    }
    
    private func configureProgressBarStyle() {
        progressBar.progress = 0
        progressBar.layer.cornerRadius = 4
        progressBar.clipsToBounds = true
    }
    
    private func setText(_ text: String) {
        questionLabel.text = "\(text)?"
    }
    
    private func getQuestion(_ index: Int) -> String {
        return questions[index][0]
    }
    
    private func getQuestionResult(_ index: Int) -> String {

        return questions[index][1]
    }
    
    private func setProgress() {
        let progress = Float(questionNumber) / Float(totalQuestions)
        
        progressBar.setProgress(progress, animated: true)
    }
    
    private func removeQuestion(_ index: Int) {
        
        if index < questions.count {
            questions.remove(at: index)
        }
    }
    
    private func generationQuestionIndex() -> Int {
        var length = questions.count
        
        if length > 0 {
            
            length -= 1
        }
        
        return Int.random(in: 0...length)
    }
}

