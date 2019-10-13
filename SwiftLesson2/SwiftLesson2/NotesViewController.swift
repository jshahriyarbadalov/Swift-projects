//
//  ViewController.swift
//  SwiftLesson2
//
//  Created by Shahriyar Badalov on 10/11/19.
//  Copyright © 2019 Shahriyar Badalov. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var notesTable: UITableView!
    @IBOutlet weak var noNotes: UILabel!
    
    var notes=Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func composeButtonTapped(_ sender: Any) {
        addNote()
    }
    
    func addNote(){
        let note="note\(notes.count+1)"
        notes.append(note)
        
        notesTable.reloadData()
    }
    
    func  deleteNoteAt(index: Int){
        notes.remove(at: index)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let noteCount=notes.count
        
        if noteCount>0{
            noNotes.isHidden=true
        }else{
            noNotes.isHidden=false
        }
        return noteCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell=tableView.dequeueReusableCell(withIdentifier: "NoteCell")! as UITableViewCell
        
        cell.textLabel?.text=notes[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteNoteAt(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

