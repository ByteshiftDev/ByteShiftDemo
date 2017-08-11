//
//  globalTimer.swift
//  ByteShiftDemo
//
//  Created by Cher Moua on 8/9/17.
//  Copyright © 2017 ByteShift. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

class GlobalTimer:NSObject {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static let sharedTimer: GlobalTimer = {
        let timer = GlobalTimer()
        return timer
    }()
    
    static let sharedTimer1: GlobalTimer = {
        let timer = GlobalTimer()
        return timer
    }()
    
    static let sharedTimer2: GlobalTimer = {
        let timer = GlobalTimer()
        return timer
    }()
    
    static let sharedTimer3: GlobalTimer = {
        let timer = GlobalTimer()
        return timer
    }()
    
    var internalTimer: Timer?
    
    public var seconds = 0
    
    func getTime() -> Int{
        return seconds
    }
    
    func startTimer(){
        if internalTimer == nil {
            internalTimer?.invalidate()
        }
        
        self.internalTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    func stopTimer(description: String){
//        guard self.internalTimer != nil
//            else {
//                fatalError("Stop Timer Error")
//        }
        
        self.internalTimer?.invalidate()
        
        let currentUser = appDelegate.user[appDelegate.currentUser]
        currentUser.visitDurations[description]? += seconds
        
        seconds = 0
    }

    func updateTimer(){
        seconds += 1;
        // print(seconds)
        
        /*
        if(seconds % 10 == 0)
        {
            /*
            let content = UNMutableNotificationContent()
            content.title = "Countdown Timer"
            content.body = "You have been here for " + String(seconds) + "seconds"
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let request = UNNotificationRequest(identifier: "duration", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
 
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let test = storyboard.instantiateViewController(withIdentifier: "durationIncentive") as! DurationIncentiveViewController
            
            test.rewardPopUp()
            */
        }
        */
    }
    
}
