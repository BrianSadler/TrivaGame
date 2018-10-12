//
//  ViewController.swift
//  Trivia Game
//
//  Created by Brian Sadler on 10/8/18.
//  Copyright © 2018 Brian Sadler. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
                return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return pickerData.count
    }
    
    @IBOutlet weak var Catagory: UIPickerView!
    var pickerData: [String] = ["General", "Animal", "Movie"]
    
    // Catpure the picker view selection
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       selectedIndex = row
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Catagory.delegate = self
        self.Catagory.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    var questions: [TriviaQuestion] = [TriviaQuestion(question: "How many states make up the U.S?", answers: ["50","100","75","15"], correctAnswerIndex: 0),TriviaQuestion(question: "What color is healthy grass?", answers: ["Blue","Pink","Orange","Green"], correctAnswerIndex: 3)]
    var movieQuestions: [TriviaQuestion] = [TriviaQuestion(question: "What is considered the first movie sequel?", answers: ["King Kong Lives","The Fall of a Nation"," Back To The Future Part II","Gremlins 2: The New Batch"], correctAnswerIndex: 1), TriviaQuestion(question: "Who played Batman in the first ever Batman movie", answers: ["Michael Keaton","Adam West","Jack Black","    Lewis Wilson"], correctAnswerIndex: 3)]
    var animalQuestions: [TriviaQuestion] = [TriviaQuestion(question: "What is the collective name for a group of lions?", answers: ["A Squad","A Flock","A Pride","A Party"], correctAnswerIndex: 2), TriviaQuestion(question: "Which is the largest living bird?", answers: ["Penguin","Ostrich","Owl","Birdman"], correctAnswerIndex: 1) ]
    var selectedIndex = 0

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { 
        if let GameView = segue.destination as? GameViewController { if pickerData[selectedIndex] == "General" {
            GameView.generalQuestions.append(contentsOf: questions)
            }
        else if pickerData[selectedIndex] == "Animal" {
            GameView.generalQuestions.append(contentsOf: animalQuestions)
            }
        else {
            GameView.generalQuestions.append(contentsOf: movieQuestions)
            }
            }
      
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) { }
}

