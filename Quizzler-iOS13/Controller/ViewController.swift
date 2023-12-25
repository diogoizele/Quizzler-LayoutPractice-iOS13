//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var answer1: Button!
    @IBOutlet weak var answer2: Button!
    @IBOutlet weak var answer3: Button!
    @IBOutlet weak var buttonStart: Button!
    @IBOutlet weak var progressBar: ProgressBar!
    @IBOutlet var questionLabel: Label!
    @IBOutlet var scoreLabel: Label!
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

        let index = updateQuestion()
        quizBrain.questionIndex = index
        setAnswers(index: index)
        
        answer1.isHidden = false
        answer2.isHidden = false
        answer3.isHidden = false
        progressBar.isHidden = false
        scoreLabel.isHidden = false
        
        buttonStart.isHidden = true
        
        backgroundView.backgroundColor = UIColor.systemYellow
        questionLabel.textColor = UIColor.systemPurple
    }
    
    @objc func auxUpdateQuestion() {
        quizBrain.questionIndex = updateQuestion()
        
        if progressBar.progress == 1.0 {
            questionLabel.setText("Sua pontuação foi de \(quizBrain.score)/\(quizBrain.totalQuestionsLength)")
            answer1.isHidden = true
            answer2.isHidden = true
            answer3.setTitle("Continuar", for: .normal)
            setViewStyles()
            answer3.setReverse(true)
        }
    }
    
    private func updateQuestion() -> Int {
        var index = 0
        
        scoreLabel.setText("Pontos: \(quizBrain.getCurrentScore())")
        
        if (!quizBrain.questions.isEmpty) {
            
            index = quizBrain.generationQuestionIndex()
            setAnswers(index: index)
            let text = quizBrain.questions[index].question
            
            questionLabel.setText(text)
        }
        
        return index
    }
    
    
    private func initialStyles(_ restart: Bool?) {
        if restart != nil && restart == true {
            questionLabel.setText("Deseja fazer outra tentativa?")
        }
        
        buttonStart.setReverse(true)
        buttonStart.isHidden = false
        
        answer1.isHidden = true
        answer2.isHidden = true
        answer3.isHidden = true
        answer3.setReverse(false)
    
        progressBar.isHidden = true
        
        scoreLabel.isHidden = true
        scoreLabel.setText("Pontos: \(quizBrain.getCurrentScore())")
        
        setViewStyles()
    }
    
    private func setViewStyles() {
        backgroundView.backgroundColor = UIColor.systemPurple
        questionLabel.textColor = UIColor.systemYellow
    }
    
    private func setAnswers(index: Int) {
        answer1.setTitle(quizBrain.questions[index].answers[0], for: .normal)
        answer2.setTitle(quizBrain.questions[index].answers[1], for: .normal)
        answer3.setTitle(quizBrain.questions[index].answers[2], for: .normal)
    }

}

