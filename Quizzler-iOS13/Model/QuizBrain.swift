
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
        Question(question: "Qual é o maior órgão do corpo humano?", answers: ["Coração", "Pele", "Intestino Grosso"], correctAnswer: "Pele"),
        Question(question: "Quantos centavos valem cinco reais?", answers: ["25", "50", "100"], correctAnswer: "100"),
        Question(question: "O que significam as letras na zona de tempo GMT?", answers: ["Tempo do Meridiano Global", "Tempo Médio de Greenwich", "Tempo Médio Geral"], correctAnswer: "Tempo Médio de Greenwich"),
        Question(question: "Qual é a palavra em francês para 'chapéu'?", answers: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(question: "Em tempos passados, o que um cavalheiro manteria no bolso do colete?", answers: ["Caderno", "Lenço", "Relógio"], correctAnswer: "Relógio"),
        Question(question: "Como se diz adeus em espanhol?", answers: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(question: "Qual destas cores NÃO está presente no logotipo do Google?", answers: ["Verde", "Laranja", "Azul"], correctAnswer: "Laranja"),
        Question(question: "Qual bebida alcoólica é feita a partir de melaço?", answers: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(question: "Que tipo de animal era Harambe?", answers: ["Panda", "Gorila", "Crocodilo"], correctAnswer: "Gorila"),
        Question(question: "Onde está localizada a Tasmânia?", answers: ["Indonésia", "Austrália", "Escócia"], correctAnswer: "Austrália"),
        Question(question: "Quem pintou a Mona Lisa?", answers: ["Vincent van Gogh", "Pablo Picasso", "Leonardo da Vinci"], correctAnswer: "Leonardo da Vinci"),
        Question(question: "Qual é o número atômico do hidrogênio?", answers: ["1", "8", "16"], correctAnswer: "1"),
        Question(question: "Qual é o planeta mais próximo do Sol?", answers: ["Marte", "Vênus", "Mercúrio"], correctAnswer: "Mercúrio"),
        Question(question: "Quem escreveu 'Dom Quixote'?", answers: ["William Shakespeare", "Miguel de Cervantes", "Charles Dickens"], correctAnswer: "Miguel de Cervantes"),
        Question(question: "Qual é o maior oceano do mundo?", answers: ["Atlântico", "Índico", "Pacífico"], correctAnswer: "Pacífico"),
        Question(question: "Quantos lados tem um heptágono?", answers: ["Sete", "Oito", "Dez"], correctAnswer: "Sete"),
        Question(question: "Qual é o maior país do mundo em termos de área terrestre?", answers: ["Rússia", "China", "Estados Unidos"], correctAnswer: "Rússia"),
        Question(question: "Quem foi o primeiro presidente do Brasil?", answers: ["Getúlio Vargas", "Deodoro da Fonseca", "Juscelino Kubitschek"], correctAnswer: "Deodoro da Fonseca"),
        Question(question: "Em que ano foi assinada a Declaração de Independência dos Estados Unidos?", answers: ["1776", "1789", "1801"], correctAnswer: "1776"),
        Question(question: "Qual é a capital do Japão?", answers: ["Pequim", "Seul", "Tóquio"], correctAnswer: "Tóquio"),
        Question(question: "Quem é o autor de 'Grande Sertão: Veredas'?", answers: ["Machado de Assis", "Guimarães Rosa", "Carlos Drummond de Andrade"], correctAnswer: "Guimarães Rosa"),
        Question(question: "Qual é o maior mamífero terrestre?", answers: ["Elefante Africano", "Rinoceronte Branco", "Girafa"], correctAnswer: "Elefante Africano"),
        Question(question: "Quem foi o líder da Revolução Cubana?", answers: ["Fidel Castro", "Che Guevara", "Batista"], correctAnswer: "Fidel Castro"),
        Question(question: "Em que ano ocorreu a Revolução Francesa?", answers: ["1789", "1815", "1832"], correctAnswer: "1789"),
        Question(question: "Qual é a montanha mais alta do mundo?", answers: ["Everest", "K2", "Kangchenjunga"], correctAnswer: "Everest")
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
        guard questionIndex < questions.count else {
            // O índice está fora dos limites do array, tratamento de erro ou retorno adequado
            return false
        }

        let actualAnswer = questions[questionIndex].correctAnswer

        if actualAnswer == userAnswer {
            score += 1
            return true
        } else {
            return false
        }
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
    
    func getCurrentScore() -> String {
        "\(self.score)/\(self.totalQuestionsLength)"
    }
    
}
