//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

struct Question {
    let title: String
    let answer: String
}

class ViewController: UIViewController {
    
    var textColor = UIColor.systemYellow
    var backgroundColor = UIColor.systemPurple
    var buttonTextColor = UIColor.black
    var buttonBackgroundColor = UIColor.systemYellow
    
    @IBOutlet weak var buttonTrue: UIButton!
    @IBOutlet weak var buttonFalse: UIButton!
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var backgroundView: UIView!
    
    let allQuestions: [Question] = [
        Question(title: "Four + Two is equal to Six", answer: "True"),
        Question(title: "Five - Three is greater than One", answer: "True"),
        Question(title: "Three + Eight is less than Ten", answer: "False"),
    ]
    var questions: [Question] = []

    var questionNumber = 0
    var questionIndex = 0
    var totalQuestionsLength = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        configureButtonStyles()
        configureProgressBarStyle()
        
        questions = allQuestions
        totalQuestionsLength = questions.count
        
        resetGame()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if (questions.isEmpty) {
            return
        }
        
        let userAnswer = sender.currentTitle!
        let actualAnswer = questions[questionIndex].answer

        if actualAnswer == userAnswer {
            print("Right!")
            score += 1
        } else {
            print("Wrong!")
        }
        
        setProgress()
        
        removeQuestion(questionIndex)
        
        questionIndex = updateQuestion()
        
        if (questions.isEmpty) {
            resetGame()
        }
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        buttonTrue.isHidden = false
        buttonFalse.isHidden = false
        progressBar.isHidden = false
        
        buttonStart.isHidden = true
        
        updateColors()
        updateScreenTheme()
        
        questionIndex = updateQuestion()
    }
    
    
    // ------ LOGIC ------
    
    private func setText(_ text: String) {
        questionLabel.text = "\(text)"
    }
    
    private func setProgress() {
        
        questionNumber += 1
        
        let progress = Float(questionNumber) / Float(totalQuestionsLength)
        
        progressBar.setProgress(progress, animated: true)
    }
    
    private func removeQuestion(_ index: Int) {
        
        if index < questions.count && !questions.isEmpty {
            questions.remove(at: index)
        }
    }
    
    private func generationQuestionIndex() -> Int {
        var length = questions.count
        
        if length > 0 {
            length -= 1
        }
        
        let questionIndex = Int.random(in: 0...length)
        
        return questionIndex
    }
    
    private func updateQuestion() -> Int {
        var index = 0
        
        if (!questions.isEmpty) {
            
            index = generationQuestionIndex()
            let text = questions[index].title
        
            setText("\(text)?")
        }
        
        return index
    }
    
    private func resetGame() {
        updateInitialColors()
        updateScreenTheme()
        hiddenQuestionButtons()
        
        setText("Start the Game")
        buttonStart.isHidden = false
        progressBar.progress = 0
        
        questions = allQuestions
        questionNumber = 0
        questionIndex = 0
        score = 0
    }
    
    // ------ STYLE ------
    
    private func configureButtonStyles() {
        configureButton(buttonTrue)
        configureButton(buttonFalse)
        configureButton(buttonStart)
    }
    
    private func configureButton(_ button: UIButton) {
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
    }
    
    private func hiddenQuestionButtons() {
        buttonTrue.isHidden = true
        buttonFalse.isHidden = true
        progressBar.isHidden = true
    }

    private func configureProgressBarStyle() {
        progressBar.progress = 0
        progressBar.layer.cornerRadius = 4
        progressBar.clipsToBounds = true
    }
    
    private func updateScreenTheme() {
        backgroundView.backgroundColor = backgroundColor
        
        updateButtonColor(buttonTrue)
        updateButtonColor(buttonFalse)
        updateButtonColor(buttonStart)
        
        questionLabel.textColor = textColor
    }
    
    private func updateColors() {
        textColor = UIColor.systemPurple
        backgroundColor = UIColor.systemYellow
        buttonTextColor = UIColor.white
        buttonBackgroundColor = UIColor.systemPurple
    }
    
    private func updateInitialColors() {
        textColor = UIColor.systemYellow
        backgroundColor = UIColor.systemPurple
        buttonTextColor = UIColor.black
        buttonBackgroundColor = UIColor.systemYellow
    }
    
    private func updateButtonColor(_ button: UIButton) {
        button.backgroundColor = buttonBackgroundColor
        button.setTitleColor(buttonTextColor, for: .normal)
    }
}

