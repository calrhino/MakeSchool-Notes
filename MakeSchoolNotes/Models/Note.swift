//
//  Note.swift
//  MakeSchoolNotes
//
//  Created by Colin Au on 6/23/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
   dynamic var title = ""
   dynamic var content = ""
   dynamic var modificationTime = Date()
}
