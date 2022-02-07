//
//  ViewController.swift
//  Xccelerator Submission Form
//
//  Created by Kaylah Harden on 2/7/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var FirstNameTextfield: UITextField!
    @IBOutlet weak var LastNameTextfield: UITextField!
    @IBOutlet weak var CarTypeTextfield: UITextField!
    @IBOutlet weak var CarColorTextfield: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    
    //Create an instance of user defaults
    let  FirstNameuserdefault = UserDefaults()
    let  LastNameuserdefault = UserDefaults()
    let  CarTypeuserdefault = UserDefaults()
    let  CarColoruserdefault = UserDefaults()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Once a user presses enter we want to save the data. Want to get that event when user taps return key(use delegate)
        FirstNameTextfield.delegate = self
        LastNameTextfield.delegate = self
        CarTypeTextfield.delegate = self
        CarColorTextfield.delegate = self
    }

    @IBAction func FindCarButton(_ sender: Any) {
        FirstNameuserdefault.setValue(FirstNameTextfield.text, forKey: "firstName")
        LastNameuserdefault.setValue(LastNameTextfield.text, forKey: "lastName")
        CarTypeuserdefault.setValue(CarTypeTextfield.text, forKey: "carType")
        CarColoruserdefault.setValue(CarColorTextfield.text, forKey: "carColor")
    }
    
    
    @IBAction func testbutton(_ sender: Any) {
        textView.text = "Car model: \(CarTypeTextfield.text!)\nCar Color \(CarColorTextfield.text!)"
    }
    
//Once a person presses the return/enter key, we come to this function
   // func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //firstname : "firstname"
        //lastname : "lastname"
        //color: "color"
        //type "type"
        
  //      FirstNameuserdefault.setValue(FirstNameTextfield.text, forKey: "firstName")
  //      LastNameuserdefault.setValue(LastNameTextfield.text, forKey: "lastName")
  //      CarTypeuserdefault.setValue(CarTypeTextfield.text, forKey: "carType")
  //      CarColoruserdefault.setValue(CarColorTextfield.text, forKey: "carColor")
        
  //      return true
 //   }
 
    
}

