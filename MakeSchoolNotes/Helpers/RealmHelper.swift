//
//  RealmHelper.swift
//  MakeSchoolNotes
//
//  Created by Colin Au on 6/23/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    //static methods
    //add
    static func addNote(_ note: Note) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(note)
        }
    }
    //delete
    static func deleteNote(_ note: Note) {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(note)
        }
    }
    //update Note
    static func updateNote(_ noteToBeUpdated: Note, newNote: Note) {
        let realm = try! Realm()
        try! realm.write() {
            noteToBeUpdated.title = newNote.title
            noteToBeUpdated.content = newNote.content
            noteToBeUpdated.modificationTime = newNote.modificationTime
        }
    }
    //retrieve Notes
    static func retrieveNotes() -> Results<Note> {
        let realm = try! Realm()
        return realm.objects(Note).sorted(byKeyPath: "modificationTime", ascending: false)
    }
}
