//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Emmanuella Oghenekaro on 3/12/25.
//

import Foundation
import UIKit

class TriviaViewController: UIViewController {
    
    @IBOutlet weak var questionOpt: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    let questions = [
            ("Q1", "Category Math", "What is 15 * 2?", ["40", "35", "50", "30"], 3),
            ("Q2", "Category Countries", "What is the capital of France?", ["London", "Berlin", "Paris", "Rome"], 2),
            ("Q3", "Category Animal", "What is man's best friend?", ["Cat", "Dog", "Parrot", "Rat"],1),
        ]
        var currentQuestionIndex = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            updateQuestion()
        }
        
        func resetGame() {
            currentQuestionIndex = 0
            updateQuestion()
        }

        func updateQuestion() {
            guard currentQuestionIndex < questions.count else { return }
            
            let currentQuestion = questions[currentQuestionIndex]
            
            questionOpt.text = currentQuestion.0
            categoryLabel.text = currentQuestion.1
            questionLabel.text = currentQuestion.2
            answerButton1.setTitle(currentQuestion.3[0], for: .normal)
            answerButton2.setTitle(currentQuestion.3[1], for: .normal)
            answerButton3.setTitle(currentQuestion.3[2], for: .normal)
            answerButton4.setTitle(currentQuestion.3[3], for: .normal)
        }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        let correctAnswerIndex = questions[currentQuestionIndex].4

        if sender.tag == correctAnswerIndex {
                let alert = UIAlertController(title: "Correct!", message: "You got it right!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    self.currentQuestionIndex += 1
                    
                    if self.currentQuestionIndex < self.questions.count {
                        self.updateQuestion()
                    } else {
                        print("End of trivia")
                        self.resetGame()
                    }
                }))
                self.present(alert, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Wrong!", message: "Try again.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
    }
}
