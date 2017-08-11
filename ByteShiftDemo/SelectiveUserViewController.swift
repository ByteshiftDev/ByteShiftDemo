//
//  SelectiveUserViewController.swift
//  ByteShiftDemo
//
//  Created by Cher Moua on 7/21/17.
//  Copyright © 2017 ByteShift. All rights reserved.
//

import UIKit

class SelectiveUserViewController: UIViewController {
    
    
    @IBOutlet weak var button1: UIButton!

    @IBOutlet weak var button2: UIButton!
    
    
    var user1Selected = true
   
    @IBAction func selectUser1(_ sender: Any) {
        appDelegate.currentUser = 0
        //button1.backgroundColor = .red
        //button2.backgroundColor = .white
        
        button1.setImage(#imageLiteral(resourceName: "icons8-Jake Filled-50"), for: .normal)
        button2.setImage(#imageLiteral(resourceName: "icons8-Jake-50"), for: .normal)

    }
    
    
    @IBAction func selectUser2() {
        appDelegate.currentUser = 1
        //button2.backgroundColor = .red
        //button1.backgroundColor = .white
        
        button2.setImage(#imageLiteral(resourceName: "icons8-Jake Filled-50"), for: .normal)
        button1.setImage(#imageLiteral(resourceName: "icons8-Jake-50"), for: .normal)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "statsSegue" {
            let nextScene = segue.destination as? StatsViewController
            if(user1Selected){
                //nextScene?.userLabel.text = "User1"
            }
            else{
                //nextScene?.userLabel.text = "User2"
            }
            
            
        }
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


extension UIViewController{
    var appDelegate:AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}
