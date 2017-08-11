//
//  BeaconNotificationsManager.swift
//  CoreApplicationPrototype
//
//  InboundRX iOS RFID Beacon Detecting Application
//  https://gitlab.com/InboundRX-Capstone/Paulsens-iOS-App
//
//  (c) 2017 Brett Chafin, Jason Brophy, Luke Kwak, Paul Huynh, Jason Custodio, Cher Moua, Thaddeus Sundin
//
//  You are free to use, copy, modify, and distribute this file, with attribution,
//  under the terms of the MIT license. See "license.txt" for more info.


/*
  Uses data from webcall to create list of notifications and beacons.
  Beacons and notificaitons are then combined into a dictionary
  according to their assigned id.
*/

import UIKit
import UserNotifications

class BeaconNotificationsManager: NSObject, ESTBeaconManagerDelegate {
    
    //Create instance of beacon manager from the Estimote Framework
    private let beaconManager = ESTBeaconManager()
    
    // Create instance of web controller to interface with the Web Server
    //private let webCallController = WebCallController()
    
    //lists to hold all notification and beacons
    private var notificationsList = [Notification]()
    private var BeaconsList = [BeaconID]()
    
    //Dictionary to connect up Beacons with thier corresponding Notifications
    private var beaconNotificationDictionary = [BeaconID:Notification]()
    
    //let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override init() {
        super.init()
        
        //Grabs all Notifications and Beacons from web server
        //print("Requesting beacons")
        
        retrieveBeacons()
        
        //print(beaconNotificationDictionary)
        
        self.beaconManager.delegate = self
        self.beaconManager.requestAlwaysAuthorization() // Launch Beacon in background
        
        //Request to display notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) {(accepted, error) in
            if !accepted {
                print("Notification access denied.")
            }
        }
    }
    
    //links up beacons with their corresponding notifications and begins monitoring for them
    private func linkBeacons() {
        for notification in notificationsList {
            
            //if the notification has a beaconID
            if let beaconID = notification.BeaconID {
                
                //find the corresponding beacon object
                for beacon in BeaconsList {
                    if beacon.asString == beaconID {
                        
                        print(beacon)
                        print(notification)
                        
                        //Start monitoring for this beacon with this notification
                        enableNotifications(for: beacon, notification: notification)
                    }
                }
            }
        }
    }
   

    
    ////Make network call to web server for Beacons and fills local beaconList and notification list
    private func retrieveBeacons() {
        /*This closure happens async, so i've moved all work for retrieving and monitoring beacons/notification
          to happend here to prevent concurrency issues
        */
        
        
        /*
        webCallController.getBeaconList { (tuple: (Bool, String, Array<Dictionary<String, Any>>?)) in
            let (isError, error, beaconList) = tuple
            if isError == false {
                
                //loop through every beacon returned and create local beacon object and corresponding notification
                for dict in beaconList! {
                    
                    
                    //create beacon object, pulling from the dictionary recieved
                    let uuid = dict["uuid"] as! String
                    let uuid_string = dict["uuid"] as! String
                    let minor_string = dict["minor_uuid"] as! String
                    let major_string = dict["major_uuid"] as! String
                    
                    //create instance of this beacon
                    let beacon = BeaconID(UUIDString: uuid, major: UInt16(major_string) ?? 0, minor: UInt16(minor_string) ?? 0)
                    
                    //if any of the values failed in this beacon, drop this beacon and move to the next
                    if (beacon.minor == 0 || beacon.major == 0) {
                        continue
                    }
                    
                    
                    //grab array of notifications contained in the beacon. This should only contain one element
                    let notificationArray = dict["notifications"] as! Array<Dictionary<String, Any>>
                    let notification = notificationArray[0]
                    
                    let entry_message = notification["entry_message"] as! String
                    let exit_message = notification["exit_message"] as? String
                    let description = notification["description"] as! String
                    let title = notification["title"] as! String
                    
                    let notification1 = Notification(Title: title, Description: description, entryMessage: entry_message, exitMessage: exit_message, BeaconID: uuid_string + ":" + major_string + ":" + minor_string)
                    
                    
                    //Add the newly created beacon and notifications to thier corresponding lists
                    self.BeaconsList.append(beacon)
                    self.notificationsList.append(notification1)
                    
                }
            } else {
                print("There was an error: "+error)
            }
 
            */
 
 
        let beacon1 = BeaconID(UUIDString: "01234567-0123-0123-0123-012345678910", major: 42296, minor: 25327)
        let beacon2 = BeaconID(UUIDString: "01234567-0123-0123-0123-012345678910", major: 22179, minor: 32626)
        let beacon3 = BeaconID(UUIDString: "01234567-0123-0123-0123-012345678910", major: 54381, minor: 53700)
        let beacon4 = BeaconID(UUIDString: "01234567-0123-0123-0123-012345678910", major: 61236, minor: 25536)
        
        
        let notification1 = Notification(Title: "Notification1", Description: "Beacon1", entryMessage: "Beacon1 Triggered", exitMessage: "Exiting Beacon1", BeaconID: "01234567-0123-0123-0123-012345678910" + ":" + String(describing: beacon1.major) + ":" + String(describing: beacon1.minor))
        
        let notification2 = Notification(Title: "Notification2", Description: "Beacon2", entryMessage: "Beacon2 Triggered", exitMessage: "Exiting Beacon2", BeaconID: "01234567-0123-0123-0123-012345678910" + ":" + String(describing: beacon2.major) + ":" + String(describing: beacon2.minor))
        
        let notification3 = Notification(Title: "Notification3", Description: "Beacon3", entryMessage: "Beacon3 Triggered", exitMessage: "Exiting Beacon3", BeaconID: "01234567-0123-0123-0123-012345678910" + ":" + String(describing: beacon3.major) + ":" + String(describing: beacon3.minor))
        
        let notification4 = Notification(Title: "Duration Incentive", Description: "Beacon4", entryMessage: "Countdown Started!", exitMessage: "Countdown Stopped!", BeaconID: "01234567-0123-0123-0123-012345678910" + ":" + String(describing: beacon4.major) + ":" + String(describing: beacon4.minor))
        
        
        self.BeaconsList.append(beacon1)
        self.BeaconsList.append(beacon2)
        self.BeaconsList.append(beacon3)
        self.BeaconsList.append(beacon4)
        
        self.notificationsList.append(notification1)
        self.notificationsList.append(notification2)
        self.notificationsList.append(notification3)
        self.notificationsList.append(notification4)


        
        //Go through our new lists and link up the notifications to the beacons
        self.linkBeacons()
        
        
    }
    
    
    //Creates dictionary entry for beacon/notification and begins monitoring for said beacon
    func enableNotifications(for beaconID: BeaconID, notification: Notification) {
        let beaconRegion = beaconID.asBeaconRegion
        self.beaconNotificationDictionary[beaconID] = notification //create dictionary entry
        self.beaconManager.startMonitoring(for: beaconRegion)   //begin monitoring for this beacon
    }
    
    
    /* This function is called every time a beacon enters the range of the device.
        The Range at which this is triggerd is dependent on the power that the Beacon is set to, 
        which is set using the Estimote applicatoin. 
 
        This will not be called if the beacon is already in range. It is only called when a beacon "enters"
        Once entered, this function finds the beacon that entered and displays the corresponsing "entry_message" notification ***/
    func beaconManager(_ manager: Any, didEnter region: CLBeaconRegion) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        print("Entered")
        
        //find the beacon that entered
        for beacon in BeaconsList{
            if (beacon.asBeaconRegion == region) {
                
                durationEnter(region: region)
                
                //get the corresponding notification
                if let notification = beaconNotificationDictionary[beacon] {
                
                    appDelegate.user[appDelegate.currentUser].visitDictionary[notification.Description]? += 1
                
                    //if this notification has an entry Message (which it should)
                    let message = notification.entryMessage
                    
                    //show message
                    self.showNotificationWithMessage(message)
                    
                }
            }
        }
        
    }
    
   
    /* Display beacon exit notification
        Similar to the didEnterRegion function, but triggers 30 seconds after the device is out of beacon range
        Exit messages are optional, so for most beacons, this function is not display a notification
    */
    func beaconManager(_ manager: Any, didExitRegion region: CLBeaconRegion) {
        
        print("Exit")
        //Find the beacon that exited
        for beacon in BeaconsList{
            if (beacon.asBeaconRegion == region) {
                
                
                //get the corresponding notificatoin
                let notification = beaconNotificationDictionary[beacon]
                
                durationExit(region: region, description: (notification?.Description)!)
                
                //if this notification has an exit message
                if let message = notification?.exitMessage{
                    
                    //show message
                    self.showNotificationWithMessage(message)
                }
            }
        }
    }
    
    func durationEnter(region: CLBeaconRegion)
    {
        if(region.identifier == "01234567-0123-0123-0123-012345678910:42296:25327")
        {
            GlobalTimer.sharedTimer.startTimer()
        }
        
        if(region.identifier == "01234567-0123-0123-0123-012345678910:22179:32626")
        {
            GlobalTimer.sharedTimer1.startTimer()
        }
        
        if(region.identifier == "01234567-0123-0123-0123-012345678910:54381:53700")
        {
            GlobalTimer.sharedTimer2.startTimer()
        }
        
        if(region.identifier == "01234567-0123-0123-0123-012345678910:61236:25536")
        {
            GlobalTimer.sharedTimer3.startTimer()
        }
        
    }
    
    func durationExit(region: CLBeaconRegion, description: String)
    {
        if(region.identifier == "01234567-0123-0123-0123-012345678910:42296:25327")
        {
            GlobalTimer.sharedTimer.stopTimer(description: description)
        }
        if(region.identifier == "01234567-0123-0123-0123-012345678910:22179:32626")
        {
            GlobalTimer.sharedTimer1.stopTimer(description: description)
        }
        
        if(region.identifier == "01234567-0123-0123-0123-012345678910:54381:53700")
        {
            GlobalTimer.sharedTimer2.stopTimer(description: description)
        }
        
        if(region.identifier == "01234567-0123-0123-0123-012345678910:61236:25536")
        {
            GlobalTimer.sharedTimer3.stopTimer(description: description)
        }
    }
    
    // Setup iOS 10 notifications for the given string
    fileprivate func showNotificationWithMessage(_ message: String) {
        
        let content = UNMutableNotificationContent()  // Create notification content
        content.title = "Beacon in Range"             // Set notification title
        content.body = message                        // Set notification message
        content.sound = UNNotificationSound.default() // Set notification sound
        
        // Condition to meet to send notification (timeInterval displays after x seconds)
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 1, repeats: false)
        
        // Create notification with trigger condition and fill with message content
        let notification = UNNotificationRequest(identifier: "Entered", content: content, trigger: trigger)
        
        
        
        //add the newly created notification to the notification center to be displayed
        UNUserNotificationCenter.current().add(notification) {(error) in
            if let error = error {
                print("Uh oh! We had an error: \(error)")
            }
        }
        
    }
    
    // Location Service Pemission Denied
    func beaconManager(_ manager: Any, didChange status: CLAuthorizationStatus) {
        if status == .denied || status == .restricted {
            NSLog("Location Services are disabled for this app, which means it won't be able to detect beacons.")
        }
    }
    
    // Bluetooth Beacon Connection Failure
    func beaconManager(_ manager: Any, monitoringDidFailFor region: CLBeaconRegion?, withError error: Error) {
        print("Monitoring failed for region: \(region?.identifier ?? "(unknown)"). Make sure that Bluetooth and Location Services are on, and that Location Services are allowed for this app. Beacons require a Bluetooth Low Energy compatible device: <http://www.bluetooth.com/Pages/Bluetooth-Smart-Devices-List.aspx>. Note that the iOS simulator doesn't support Bluetooth at all. The error was: \(error)")
    }
    
}





