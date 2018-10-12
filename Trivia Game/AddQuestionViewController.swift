//
//  AddQuestionViewController.swift
//  Trivia Game
//
//  Created by Brian Sadler on 10/11/18.
//  Copyright © 2018 Brian Sadler. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController {
    @IBOutlet weak var catagoryChoice: UISegmentedControl!
    @IBOutlet weak var userQuestion: UITextField!
    @IBOutlet weak var userAnswer1: UITextField!
    @IBOutlet weak var userAnswer2: UITextField!
    @IBOutlet weak var userAnswer3: UITextField!
    @IBOutlet weak var userAnswer4: UITextField!
    @IBOutlet weak var correctAnswer: UISegmentedControl!
    var newQuestion: TriviaQuestion!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? ViewController {
            if let destination = segue.destination as? ViewController {
                switch catagoryChoice.selectedSegmentIndex { case 0: destination.questions.append(newQuestion)
                case 1:
                    destination.animalQuestions.append(newQuestion)
                case 2:
                    destination.movieQuestions.append(newQuestion)
                    
                default:
                    break
                }
            }
        }
    }
        
        func showErrorAlert() {
            let errorAlert = UIAlertController(title: "Error", message: "Please enter text in all fields, or hit the back button to go back to the quiz", preferredStyle: .actionSheet)
            let dismissAction = UIAlertAction(title: "close", style: .default, handler: nil)
            errorAlert.addAction(dismissAction)
            self.present(errorAlert, animated: true, completion: nil)
        }
        @IBAction func submitButton(_ sender: Any) {
            guard let question = userQuestion.text, !question.isEmpty,
                let answer1 = userAnswer1.text, !answer1.isEmpty,
                let answer2 = userAnswer2.text, !answer1.isEmpty,
                let answer3 = userAnswer3.text, !answer3.isEmpty,
                let answer4 = userAnswer4.text, !answer4.isEmpty else {
                    showErrorAlert()
                    return
            }
            newQuestion = TriviaQuestion(question: question, answers: [answer1, answer2, answer3, answer4], correctAnswerIndex: correctAnswer.selectedSegmentIndex)
            self.performSegue(withIdentifier: "unwindToHome", sender: self)
            
        }
        
}

