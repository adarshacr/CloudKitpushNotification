//
//  ViewController.swift
//  PushNotification
//
//  Created by Adarsha Upadhya on 16/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var notes = [Notes]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getNotes()
    }
    
    func getNotes(){
        
        NoteService.getNotes { (notes) in
            self.notes = notes
            self.tableView.reloadData()
        }
    }
    
    @IBAction func pp(_ sender: UIBarButtonItem) {
        AlertService.compose(viewController: self) { (notes) in
            let record = notes.noteRecord()
            CKService.shared.saveRecord(note: record)
            
            self.insertNote(note: notes)
        }
        
    }
    @IBOutlet weak var tableView: UITableView!
   
    func insertNote(note:Notes){
        self.notes.insert(note, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
       
        tableView.insertRows(at: [indexPath], with: .automatic)
       
    }
}



extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.ID, for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].note
        return cell
    }
}



extension UITableViewCell{
    static var ID:String{
        return String(describing: self)
    }
}
