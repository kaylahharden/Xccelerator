//
//  APIFunctions.swift
//  Xccelerator
//
//  Created by Sarah Mullings on 2/8/22.
//

import Foundation
import Alamofire

struct carPost: Decodable {   // allows us to decode what the server is sending us in order to access it and use it
    var make: String
    var color: String
}

class APIFunctions{
    
    var delegate: DataDelegate?
    static let functions = APIFunctions() // creates an instance of the API function class
    
    func getPosts(){
        AF.request("http://10.84.114.54:8082/fetch").response { response in   //makes a request to the server and display the response ("response in" allows us to access the data)
            
            print(response.data)  // prints the servers actual data
            
            let data = String(data:response.data!, encoding: .utf8)  // turns the data that the server sends us into a string that we can parse
            
            // create a delegate and protocol method that would allow us to send the data to the user
            self.delegate?.updateArray(newArray: data!)
        }
    }
    
    func addPost (make: String, color: String){
        
        AF.request("http://10.84.114.54:8082/create", method: .post, encoding: URLEncoding.httpBody, headers: ["make": make, "color": color]).responseJSON { response in
            
        }
        
    }
    
}
