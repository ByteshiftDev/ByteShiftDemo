//
//  HomeViewController.swift
//  ByteShiftDemo
//
//  Created by Cher Moua on 7/21/17.
//  Copyright © 2017 ByteShift. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*  Get request example
        let wc = WebCallController()
        let geturl = sessionURL + "users/21"
        
        wc.getRequest(urlToCall: geturl) { (serverResponse) in
            print(serverResponse)
        }
        */
        
        
        
        /* Post request example
         
        var data = [String:Any]()
        
        data["first_name"] = "Jon"
        data["last_name"] = "Snow"
        data["email"] = "WhiteWalkersRscary@buildtheWall.com"
        
        let posturl = sessionURL + "users"
        
        wc.postRequest(urlToCall: posturl, data: data) { (serverResponse) in
            print(serverResponse)
        }
        */
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


