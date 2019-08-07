//
//  Task+Convienence.swift
//  Task
//
//  Created by AlphaDVLPR on 8/7/19.
//  Copyright © 2019 AlphaDVLPR. All rights reserved.
//

import Foundation
import CoreData

//We are creating the convience for Task since we made a CoreData of Task

extension Task {
    
    //Next we are doing an init for the extension
    @discardableResult
    convenience init(name: String, notes: String = "", due: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        
        //Now we are setting the inputs
        
        self.init(context: context)
        self.name = name
        self.notes = notes
        
    }
    
}
