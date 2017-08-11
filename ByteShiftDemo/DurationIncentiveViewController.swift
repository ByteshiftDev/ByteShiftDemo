//
//  DurationIncentiveViewController.swift
//  ByteShiftDemo
//
//  Created by Cher Moua on 7/21/17.
//  Copyright © 2017 ByteShift. All rights reserved.
//

import UIKit

class DurationIncentiveViewController: UIViewController {
    
    /***************/
    /*** OUTLETS ***/
    /***************/

    @IBOutlet weak var timerLable: UILabel!
    
    @IBOutlet weak var rewardCell: UIImageView!

    /***************/
    /** VARIABLES **/
    /***************/
    
    var seconds = 0;
    var timer = Timer();
    
    /***************/
    /** FUNCTIONS **/
    /***************/
    
    // Setup seconds
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timerLable.text = "\(seconds)" + " Seconds";
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateTimer() {
        self.seconds += 1
        timerLable.text = "\(seconds)" + " Seconds";
        
        if(seconds == 20)
        {
            rewardPopUp()
            // timer.invalidate()
        }
    }
    
    // Create reward redeeming popup
    func rewardPopUp()
    {
        // Setup text fields
        let title = "REWARD"
        let message = "Thank you for staying with us!"
        
        // Create Alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    
        // Setup image field
        let xOrigin = (alert.view.frame.width)/10
        
        let yOrigin = (alert.view.frame.height)/4
        
        let imageView = UIImageView(frame: CGRect(x: xOrigin, y: yOrigin, width: 200, height: 200))
        
        imageView.image = #imageLiteral(resourceName: "reward")
        
        alert.view.addSubview(imageView)
        
        // Add reward button
        let button = UIAlertAction(title: "REDEEM", style: UIAlertActionStyle.default, handler: {(action: UIAlertAction) -> Void in
            
            self.rewardCell.image = imageView.image
        })
        
        alert.addAction(button)
        
        present(alert, animated: true, completion: nil)
    }
}
