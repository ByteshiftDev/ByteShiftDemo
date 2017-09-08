//
//  WebCallController.swift
//  ByteShiftDemo
//
//  Created by Brett Chafin on 8/18/17.
//  Copyright © 2017 ByteShift. All rights reserved.
//

import Foundation
import UIKit

let sessionURL = "https://byteshift-api.herokuapp.com/"


class WebCallController: URLSession  {
    
    // Make a call to a web address to retrieve some data
    // Returns an array of dictionaries via a completion handler
    func getRequest(urlToCall: String, callback: @escaping (Dictionary<String, Any>) -> ()) {
        
        let url = URL(string: urlToCall)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        // Insert a header to specify that we want a JSON formatted response
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            // If there was an error, print it to the console
            // Then, call the closure with the error and return from the function
            if error != nil {
                print("There was an error!:\n" + urlToCall)
                print(error!)
                callback(["error":error!.localizedDescription])
                return
            }
            
            /*
             // Otherwise, print the data to the console
             let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
             print("\n\nDataRecieved:\n" + urlToCall)
             print(str!)
             print("\n-----\n")
             */
            
            // Convert the data recieved into JSON
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                //print(json)
                let dictionaryArray = json as! Dictionary<String, Any>
                callback(dictionaryArray)
                
            } catch let jsonError {
                print("There was a json error!:\n")
                print(jsonError)
                callback(["error":jsonError.localizedDescription])
            }
            
            }.resume()
    }
    
    
    
    // Make a POST request to the web server
    // Callback function is run synchronously after this function
    func postRequest(urlToCall: String, data: Dictionary<String, Any>, callback: @escaping (Dictionary<String, Any>) -> ()) {
        // Convert data into JSON format
        let jsonData = try? JSONSerialization.data(withJSONObject: data)
        
        // Create POST request
        let url = URL(string: urlToCall)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        
        // Create semaphore
        let semaphore = DispatchSemaphore(value: 0)
        
        // Insert JSON header and JSON data
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        // Insert a header to specify that we want a JSON formatted response
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpBody = jsonData
        
        // Execute the request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // If there was an error, print it to the console and return from the function
            if error != nil {
                print("There was an error!:\n")
                print(error!)
                callback(["error":error!.localizedDescription])
                semaphore.signal()
                return
            }
            
            /*
             // Otherwise, print the data to the console
             let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
             print("\n\nDataRecieved from POST:\n")
             print(str!)
             print("\n-----\n")
             */
            
            // Convert the data recieved into JSON
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                let dictionaryArray = json as! Dictionary<String, Any>
                callback(dictionaryArray)
            } catch let jsonError {
                print("There was a json error!:\n")
                print(jsonError)
                callback(["error":jsonError.localizedDescription])
            }
            // Signal the semaphore
            semaphore.signal()
        }
        // Let the dataTask resume (run the urlsession request, essentially)
        task.resume()
        // Wait on the semaphore within the callback function
        semaphore.wait()
    }
    
    func createUser(firstName: String, lastName:String, email:String, password:String) {
        var data = [String:Any]()
        
        data["first_name"] = firstName
        data["last_name"] = lastName
        data["email"] = email
        data["password"] = password
        
        let posturl = sessionURL + "users"
        
        postRequest(urlToCall: posturl, data: data) { (serverResponse) in
            print(serverResponse)
        }

    }
  
  
  func loginUser(email: String, password: String) {
    let getURL = sessionURL + "user/check?email=\(email)&password=\(password)"
    
    getRequest(urlToCall: getURL) { (serverResponse) in
      print(serverResponse)
      
      self.appDelegate.globalUser.firstName = serverResponse["first_name"] as! String
      self.appDelegate.globalUser.lastName = serverResponse["last_name"] as! String
      self.appDelegate.globalUser.ID = serverResponse["id"] as! Int
      self.appDelegate.globalUser.email = serverResponse["email"] as! String
      self.appDelegate.globalUser.status = serverResponse["status"] as! String
    }
  }
  
  func updateUser() {
//    //var data = [String:Any]()
//    
//    /*
//    data["email"] = email
//    data["password"] = password
//    data["visit"] = visit
//    data["duration"] = duration
//    */
//    let posturl = sessionURL + "users"
//    
//    postRequest(urlToCall: posturl, data: data) { (serverResponse) in
//      print(serverResponse)
//    }
  }

}


extension WebCallController{
  var appDelegate:AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
  }
}


