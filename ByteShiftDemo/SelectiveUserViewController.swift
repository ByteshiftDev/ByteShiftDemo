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
   
    
    @IBAction func selectUser1() {
        button1.backgroundColor = .red
        button2.backgroundColor = .white
        
    }
    
    @IBAction func selectUser2() {
        button2.backgroundColor = .red
        button1.backgroundColor = .white
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
