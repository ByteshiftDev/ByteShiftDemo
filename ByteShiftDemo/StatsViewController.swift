//
//  StatsViewController.swift
//  ByteShiftDemo
//
//  Created by Brett Chfin on 7/26/17.
//  Copyright © 2017 ByteShift. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    

    @IBOutlet weak var userLabel: UILabel!
    
    public func changeUserLabel(newLabel: String){
        userLabel.text = newLabel
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
                
        userLabel.text = "User" + String(describing: appDelegate.currentUser)
        
        
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
