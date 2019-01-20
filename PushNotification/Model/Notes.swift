//
//  Notes.swift
//  PushNotification
//
//  Created by Adarsha Upadhya on 16/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import Foundation
import CloudKit


struct Notes {
    let note:String
    static let recordType = "Note"
    
    init(note:String) {
        self.note = note
    }
    
    init?(record:CKRecord) {
        
        guard let title = record.value(forKey: "title") as? String else{
            return nil
        }
        self.note = title
    }
    
    func noteRecord()->CKRecord{
        let record = CKRecord(recordType: Notes.recordType)
        record.setValue(note, forKey: "title")
        return record
    }
}
