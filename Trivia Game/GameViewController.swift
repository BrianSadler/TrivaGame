//
//  GameViewController.swift
//  Trivia Game
//
//  Created by Brian Sadler on 10/10/18.
//  Copyright © 2018 Brian Sadler. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var questions: [TriviaQuestion] = [TriviaQuestion(question: "How many states make up the U.S?", answers: ["50","100","75","15"], correctAnswerIndex: 0),TriviaQuestion(question: "What color is healthy grass?", answers: ["Blue","Pink","Orange","Green"], correctAnswerIndex: 3)]
    var answeredQuestions: [TriviaQuestion] = []
    var randomIndex: Int!
 @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!

    var score = 0 {
        didSet {
            // property observer for score
            scoreLabel.text = "Score:\(score)"
        }
    
    }
    var currentQuestion: TriviaQuestion! {
        didSet {
    
            questionText.text = currentQuestion.question
            answer1.setTitle(currentQuestion.answers[0], for: .normal)
            answer2.setTitle(currentQuestion.answers[1], for: .normal)
            answer3.setTitle(currentQuestion.answers[2], for: .normal)
            answer4.setTitle(currentQuestion.answers[3], for: .normal)
        }
    }
    func getNewQuestion() {
        if questions.count > 0 {
        randomIndex = Int(arc4random_uniform(UInt32(questions.count)))
            currentQuestion = questions[randomIndex]
        } else {
            resetGame()
        }
    }
    func resetGame() {
        score = 0
        if !questions.isEmpty {
            answeredQuestions.append(contentsOf: questions)
        }
        questions = answeredQuestions
        answeredQuestions.removeAll()
        getNewQuestion()
    }
    func showCorrectAnswerAlert (){
        let correctAlert = UIAlertController(title: "Correct", message: "\(currentQuestion.correctAnswer) was the correct answer", preferredStyle: .actionSheet)
        // UIAlertAction
        let closeAction = UIAlertAction(title:"close", style: .default) { _ in
            self.answeredQuestions.append(self.questions.remove(at: self.randomIndex))
            self.getNewQuestion()
        }
        // Add the action to the alert controller
        correctAlert.addAction(closeAction)
        // present the alert controller
        self.present(correctAlert,animated: true, completion: nil)
    }
    // show an alert when the user gets the question wrong
    func showIncorrectAnswerAlert(){
        let incorrectAlert = UIAlertController(title: "Incorrect", message: "\(currentQuestion.correctAnswer) was the correct answer", preferredStyle: .actionSheet)
        // UIAlertAction
        let closeAction = UIAlertAction(title:"close", style: .default) { _ in
            self.answeredQuestions.append(self.questions.remove(at: self.randomIndex))
            self.getNewQuestion()
        }
        // Add the action to the alert controller
        incorrectAlert.addAction(closeAction)
        // present the alert controller
        self.present(incorrectAlert,animated: true, completion: nil)
    }
    
    @IBAction func Choice(_ sender: UIButton) {
        if sender.tag == currentQuestion.correctAnswerIndex {
            // they got the question right, so we need to let them know
            showCorrectAnswerAlert()
            score += 1
        } else {
            // they got the question wrong, so we need to let them know
            showIncorrectAnswerAlert()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getNewQuestion()
        // show an alert when the user gets the question right
       
        
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
