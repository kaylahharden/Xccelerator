//
//  CarPostViewController.swift
//  Xccelerator
//
//  Created by Sarah Mullings on 2/8/22.
//
//  Reference: https://www.youtube.com/watch?v=77ryTAQocFM&list=RDCMUC2D6eRvCeMtcF5OGHf1-trw&index=2



import UIKit

protocol DataDelegate {
    func updateArray(newArray: String)
}

class CarPostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var carPostsArray = [carPost]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "updatePostSegue"{   // if we are on this identifier
            let carNote = segue.destination as! CarViewController
            carNote.car = carPostsArray[carPostTableView.indexPathForSelectedRow!.row]
            carNote.update = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // this function determines the number of rows
        return carPostsArray.count // returns the amount of posts in the array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarPostsCell") as! CarPostsCell   //this creates a prototype cell that will be reused
        cell.makeLabel.text = carPostsArray[indexPath.row].make
        cell.colorLabel.text = carPostsArray[indexPath.row].color
        return cell
    }
    

    @IBOutlet weak var carPostTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        APIFunctions.functions.getPosts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        APIFunctions.functions.getPosts()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIFunctions.functions.delegate = self  // lets APIFunctions know that data is being handled by the view controller
        APIFunctions.functions.getPosts()
        print(carPostsArray)
        // Do any additional setup after loading the view.
        //The following tells the story board that the view controller provides the data for the table view
        carPostTableView.delegate = self
        carPostTableView.dataSource = self
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

extension CarPostViewController: DataDelegate{
    func updateArray(newArray: String) {
        do{
            carPostsArray = try JSONDecoder().decode([carPost].self, from: newArray.data(using: .utf8)!)
            // decodes the server data in JSON format
            print("this is a test")
            print(carPostsArray)
        }catch{
            print("Failed to decode")
        }
        self.carPostTableView?.reloadData()  //reloads the data to always be updated
    }
}


