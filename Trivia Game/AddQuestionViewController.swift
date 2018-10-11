//
//  AddQuestionViewController.swift
//  Trivia Game
//
//  Created by Brian Sadler on 10/11/18.
//  Copyright © 2018 Brian Sadler. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController {
    @IBOutlet weak var userQuestion: UITextField!
    @IBOutlet weak var userAnswer1: UITextField!
    @IBOutlet weak var userAnswer2: UITextField!
    @IBOutlet weak var userAnswer3: UITextField!
    @IBOutlet weak var userAnswer4: UITextField!
    @IBOutlet weak var correctAnswer: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func submitButton(_ sender: Any) {
        
    }
    
}
