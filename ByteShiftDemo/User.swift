//
//  User.swift
//  ByteShiftDemo
//
//  Created by Brett Chafin on 7/26/17.
//  Copyright © 2017 ByteShift. All rights reserved.
//

import Foundation

var globalID = 0;

class User {
    var ID: Int
    var status: String
    var visitDictionary = [String:Int]()
    
    init(){
        status = "new user"
        globalID = globalID + 1
        ID = globalID
    }
    
    func incrementVisitCount(key: String){
        visitDictionary[key] = visitDictionary[key]! + 1
    }
    
    func updateStatus(){
    }
}
