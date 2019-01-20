//
//  NoteService.swift
//  PushNotification
//
//  Created by Adarsha Upadhya on 16/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import Foundation



class NoteService{
    
    private init(){}
    
    static func getNotes(completionHandler:@escaping ([Notes])->Void){
        
        CKService.shared.query { (records) in
            var notes = [Notes]()
            
            for item in records{
                guard let note = Notes(record: item) else {continue}
                    notes.append(note)
            }
            completionHandler(notes)
        }
    }
    
}
