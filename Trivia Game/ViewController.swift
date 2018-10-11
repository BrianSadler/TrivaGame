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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { 
        
      
            }
}

