//
//  CarViewController.swift
//  Xccelerator
//
//  Created by Sarah Mullings on 2/15/22.
//

import UIKit

class CarViewController: UIViewController {
    
    var car: carPost?
    var update = false

    @IBOutlet weak var deleteCarButton: UIButton!
    @IBOutlet weak var makeTextView: UILabel!
    @IBOutlet weak var colorTextView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if update == true {
            makeTextView.text = car?.make
            colorTextView.text = car?.color
        }
        
    }
    @IBAction func deleteOnClick(_ sender: Any) {
        print("car post deleted")
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
