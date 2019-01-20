//
//  AlertService.swift
//  PushNotification
//
//  Created by Adarsha Upadhya on 16/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import Foundation
import UIKit

class AlertService{
    
    
    private init(){
    
    }
    
    static func compose(viewController:UIViewController,completion:@escaping (Notes)->Void){
        
        let alert = UIAlertController(title: "Compose Message", message:nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "What's on your mind?"
        }
        let alertAction = UIAlertAction(title: "Post", style: .default) { (postAction) in
            guard let postText = alert.textFields?.first?.text else{ return}
            completion(Notes(note: postText))
        }
        
        alert.addAction(alertAction)
        
        viewController.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
}
