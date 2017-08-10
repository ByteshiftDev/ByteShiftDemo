//
//  StatsViewController.swift
//  ByteShiftDemo
//
//  Created by Brett Chfin on 7/26/17.
//  Copyright © 2017 ByteShift. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!

    @IBOutlet weak var userLabel: UILabel!
    
    
    /**************** Visit Count ****************/
    @IBOutlet weak var visitLabel1: UILabel!
    @IBOutlet weak var visitLabel2: UILabel!
    @IBOutlet weak var visitLabel3: UILabel!
    @IBOutlet weak var visitLabel4: UILabel!
    
    @IBOutlet weak var visitCount1: UILabel!
    @IBOutlet weak var visitCount2: UILabel!
    @IBOutlet weak var visitCount3: UILabel!
    @IBOutlet weak var visitCount4: UILabel!
    
    
    /**************** Visit Duration ****************/
    @IBOutlet weak var durationLabel1: UILabel!
    @IBOutlet weak var durationLabel2: UILabel!
    @IBOutlet weak var durationLabel3: UILabel!
    @IBOutlet weak var durationLabel4: UILabel!
    
    @IBOutlet weak var durationTime1: UILabel!
    @IBOutlet weak var durationTime2: UILabel!
    @IBOutlet weak var durationTime3: UILabel!
    @IBOutlet weak var durationTime4: UILabel!
    
    
    
    public func changeUserLabel(newLabel: String){
        userLabel.text = newLabel
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUser = appDelegate.user[appDelegate.currentUser]
                
        userLabel.text = "User" + String(describing: appDelegate.currentUser)
        statusLabel.text = currentUser.status
        
        var keyArray = Array(currentUser.visitDictionary.keys)
        var keyVisitTimeArray = Array(currentUser.visitDurations.keys)
    
        visitLabel1.text = keyArray[0]
        visitLabel2.text = keyArray[1]
        visitLabel3.text = keyArray[2]
        visitLabel4.text = keyArray[3]
        
        visitCount1.text = String(describing: currentUser.visitDictionary[keyArray[0]]!)
        visitCount2.text = String(describing: currentUser.visitDictionary[keyArray[1]]!)
        visitCount3.text = String(describing: currentUser.visitDictionary[keyArray[2]]!)
        visitCount4.text = String(describing: currentUser.visitDictionary[keyArray[3]]!)
        
        
        durationLabel1.text = keyVisitTimeArray[0]
        durationLabel2.text = keyVisitTimeArray[1]
        durationLabel3.text = keyVisitTimeArray[2]
        durationLabel4.text = keyVisitTimeArray[3]
        
        durationTime1.text = String(describing: currentUser.visitDurations[keyVisitTimeArray[0]]!)
        durationTime2.text = String(describing: currentUser.visitDurations[keyVisitTimeArray[1]]!)
        durationTime3.text = String(describing: currentUser.visitDurations[keyVisitTimeArray[2]]!)
        durationTime4.text = String(describing: currentUser.visitDurations[keyVisitTimeArray[3]]!)
        
        

        
    
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
