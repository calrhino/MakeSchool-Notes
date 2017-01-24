//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import RealmSwift

class DisplayNoteViewController: UIViewController {
    var note: Note?
    
  @IBOutlet weak var noteContentTextView: UITextView!
  
    @IBOutlet weak var noteTitleTextField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let listNotesTableViewController = segue.destination as! ListNotesTableViewController
    if segue.identifier == "Save" {
        if let note = note {
            // 1. Because the updateNote(_:newNote:) RealmHelper method takes two parameters (an old note to be updated and new note), we must create a new note with the user's updated note content and pass it to the helper.
            let newNote = Note()
            
            newNote.title = noteTitleTextField.text ?? ""
            newNote.content = noteContentTextView.text ?? ""
            RealmHelper.updateNote(note, newNote: newNote)
        } else {
            //if note does not exist, then create new note
            // 3
            let note = Note()
            note.title = noteTitleTextField.text ?? ""
            note.content = noteContentTextView.text ?? ""
            note.modificationTime = Date()
            //2. Here we use our Realm helper to add the newly created note to Realm, so that it's persisted.
            RealmHelper.addNote(note)
        }
        //3. Here we make sure that the ListNotesTableViewController is up to date with the changes we just made by retrieving all the notes from Realm and assigning them to the notes property.
        listNotesTableViewController.notes = RealmHelper.retrieveNotes()
    }
  }
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // 1
    if let note = note {
        
        //2
        noteTitleTextField.text = note.title
        noteContentTextView.text = note.content
    }else{
        //3
        noteTitleTextField.text = ""
        noteContentTextView.text = ""
    }
  }
}
