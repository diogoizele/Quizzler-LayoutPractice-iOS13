//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonTrue: Button!
    @IBOutlet weak var buttonFalse: Button!
    @IBOutlet weak var buttonStart: Button!
    @IBOutlet weak var progressBar: ProgressBar!
    @IBOutlet var questionLabel: Label!
    @IBOutlet var backgroundView: UIView!
    
    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()

        initialStyles(false)
        
        quizBrain.resetGameState()
    }
    
    @IBAction func answerButtonPressed(_ sender: Button) {
        
        if (quizBrain.questions.isEmpty) {
            if progressBar.progress == 1.0 {
                quizBrain.resetGameState()
                initialStyles(true)
                progressBar.progress = 0.0
            }
            return
        }
        
        let userAnswer = sender.currentTitle!
        let checkedAnswer = quizBrain.checkAnswer(userAnswer)
        
        sender.onCheckUserAnswer(checkedAnswer)
        
        quizBrain.questionNumber += 1
        progressBar.setProgress(quizBrain.questionNumber, quizBrain.totalQuestionsLength)
        
        quizBrain.removeQuestion()
        
        Timer.scheduledTimer(timeInterval: Button.buttonAnimationDuration, target: self, selector: #selector(auxUpdateQuestion), userInfo: nil, repeats: false)
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        buttonTrue.isHidden = false
        buttonFalse.isHidden = false
        progressBar.isHidden = false
        
        buttonStart.isHidden = true
        
        backgroundView.backgroundColor = UIColor.systemYellow
        questionLabel.textColor = UIColor.systemPurple
        
        quizBrain.questionIndex = updateQuestion()
    }
    
    @objc func auxUpdateQuestion() {
        quizBrain.questionIndex = updateQuestion()
        
        if progressBar.progress == 1.0 {
            questionLabel.setText("Your score was \(quizBrain.score)/\(quizBrain.totalQuestionsLength)")
            buttonTrue.isHidden = true
            buttonFalse.setTitle("Continue", for: .normal)
            setViewStyles()
            buttonFalse.setReverse(true)
        }
    }
    
    private func updateQuestion() -> Int {
        var index = 0
        
        if (!quizBrain.questions.isEmpty) {
            
            index = quizBrain.generationQuestionIndex()
            let text = quizBrain.questions[index].title
            
            questionLabel.setText(text)
        }
        
        return index
    }
    
    
    private func initialStyles(_ restart: Bool?) {
        
        buttonStart.setReverse(true)
        buttonStart.isHidden = false
        
        buttonTrue.isHidden = true
        buttonFalse.isHidden = true
        buttonFalse.setTitle("False", for: .normal)
        buttonFalse.setReverse(false)
        progressBar.isHidden = true
        
        setViewStyles()
        
        if restart != nil && restart == true {
            questionLabel.setText("Restart the game")
            buttonStart.setTitle("Restart", for: .normal)
        }
    }
    
    private func setViewStyles() {
        backgroundView.backgroundColor = UIColor.systemPurple
        questionLabel.textColor = UIColor.systemYellow
    }

}

