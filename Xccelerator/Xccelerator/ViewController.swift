//
//  ViewController.swift
//  Xccelerator Submission Form
//
//  Created by Sarah Mullings and Kaylah Harden on 2/7/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var FirstNameTextfield: UITextField!
    @IBOutlet weak var LastNameTextfield: UITextField!
    @IBOutlet weak var CarTypeTextfield: UITextField!
    @IBOutlet weak var CarColorTextfield: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var postCarButton: UIButton!
    
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

//    @IBAction func FindCarButton(_ sender: Any) {
//        FirstNameuserdefault.setValue(FirstNameTextfield.text, forKey: "firstName")
//        LastNameuserdefault.setValue(LastNameTextfield.text, forKey: "lastName")
//        CarTypeuserdefault.setValue(CarTypeTextfield.text, forKey: "carType")
//        CarColoruserdefault.setValue(CarColorTextfield.text, forKey: "carColor")
//        APIFunctions.functions.addPost(make: CarTypeTextfield.text!, color: CarColorTextfield.text!)
//    }
    
    
    @IBAction func testbutton(_ sender: Any) {
        textView.text = "Car model: \(CarTypeTextfield.text!)\nCar Color \(CarColorTextfield.text!)"
    }
    
    @IBAction func postOnClick(_ sender: Any) {
        print("car post saved")
        APIFunctions.functions.addPost(make: CarTypeTextfield.text!, color: CarColorTextfield.text!)
        self.navigationController?.popViewController(animated: true)
    }
}

