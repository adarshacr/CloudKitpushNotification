//
//  CKService.swift
//  PushNotification
//
//  Created by Adarsha Upadhya on 16/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import Foundation
import CloudKit


class CKService{
    
    private init(){}
    static let shared = CKService()
    
    let privateDataBase = CKContainer.default().privateCloudDatabase
    
     func saveRecord(note:CKRecord){
        
        privateDataBase.save(note) { (ckrecord, error) in
        
        }
    }
    
    func query(completionHandler:@escaping (([CKRecord])->Void)){
        
        let query = CKQuery(recordType: Notes.recordType, predicate: NSPredicate(value: true))
        
        privateDataBase.perform(query, inZoneWith: nil) { (records, error) in
            
            guard let ckrecords = records else{ return }
            
            completionHandler(ckrecords)
        }
    }
    
    func subscribe(){
        
       CKQuerySubscription(recordType: Notes.recordType, predicate: NSPredicate(value: true))
        
    }
    
    
    
    
}
